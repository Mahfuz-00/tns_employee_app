import 'package:touch_and_solve_inventory_app/Data/Repositories/activity_repositories_impl.dart';
import 'package:touch_and_solve_inventory_app/Domain/Usecases/activity_usecases.dart';
import 'package:touch_and_solve_inventory_app/Data/Sources/local_data_sources.dart';
import 'package:touch_and_solve_inventory_app/Data/Sources/remote_data_sources.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../Common/Helper/local_database_helper.dart';
import '../../../Data/Repositories/activity_form_repositories_impl.dart';
import '../../../Data/Repositories/sign_in_repositories_impl.dart';
import '../../../Data/Sources/activity_form_remote_source.dart';
import '../../../Domain/Repositories/activity_form_repositories.dart';
import '../../../Domain/Repositories/sign_in_repositories.dart';
import '../../../Domain/Repositories/activity_repositories.dart';
import '../../../Domain/Usecases/activity_form_usercase.dart';
import '../../../Domain/Usecases/sign_in_usercases.dart';
import '../../../Presentation/Activity Creation Page/Bloc/activity_form_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // **1. Register database instance**
  final database = await DatabaseHelper.initializeDatabase();
  print("Database initialized: $database");

  if (database == null) {
    throw Exception("Database initialization failed");
  }

  // **2. Remove Duplicates**
  await DatabaseHelper.removeDuplicates();
  print("Duplicates removed");

  // **3. Print database structure and data for debugging**
  await DatabaseHelper.printDatabaseStructureAndData();

  // **4. Register DataSources**
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource(
      database)); // Local data source depends on the initialized database.
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSource()); // Remote data source instance.

  // **5. Register Repositories**
  getIt.registerLazySingleton<ActivityRepository>(() => ActivityRepositoryImpl(
        getIt<RemoteDataSource>(), // Inject remote data source.
        getIt<LocalDataSource>(), // Inject local data source.
      ));

  // **6. Register UseCases**
  getIt.registerLazySingleton<ActivityUseCase>(
      () => ActivityUseCase(getIt<ActivityRepository>())); // Fetch task use case.

  getIt.registerLazySingleton<SigninRepository>(
      () => SigninRepositoryImpl()); // Sign-in repository.

  // **7. Register SigninUseCase with its dependencies**
  getIt.registerLazySingleton<SigninUseCase>(
    () => SigninUseCase(
      getIt<SigninRepository>(), // Inject TokenRepository.
      getIt<RemoteDataSource>(), // Inject RemoteDataSource.
    ),
  );

  // **8. Register Bloc**
  getIt.registerFactory(() =>
      ActivityFormBloc(getIt())); // ActivityFormBloc depends on its use case.

  // **9. Register Use Cases**
  getIt.registerLazySingleton(
      () => ActivityFormUseCase(getIt())); // Create activity use case.

  // **10. Register Repository**
  getIt.registerLazySingleton<ActivityFormRepository>(
    () => ActivityFormRepositoryImpl(getIt()), // Inject activity repository.
  );

  // **11. Register External Dependencies**
  getIt.registerLazySingleton(
      () => http.Client()); // HTTP client for making network requests.

  // **12. Register Remote Sources**
  getIt.registerLazySingleton(() => ActivityFormRemoteDataSource(
      getIt())); // Activity remote data source depends on HTTP client.
}
