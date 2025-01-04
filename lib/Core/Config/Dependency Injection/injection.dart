import 'package:touch_and_solve_inventory_app/Data/Repositories/task_repositories_impl.dart';
import 'package:touch_and_solve_inventory_app/Domain/Usecases/fetch_task_usecases.dart';
import 'package:touch_and_solve_inventory_app/Data/Sources/local_data_sources.dart';
import 'package:touch_and_solve_inventory_app/Data/Sources/remote_data_sources.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';

import '../../../Common/Helper/local_database_helper.dart';
import '../../../Data/Repositories/sign_in_repositories_impl.dart';
import '../../../Domain/Repositories/sign_in_repositories.dart';
import '../../../Domain/Repositories/task_repositories.dart';
import '../../../Domain/Usecases/sign_in_usercases.dart';


final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Register database instance
  final database = await DatabaseHelper.initializeDatabase();
  print("Database initialized: $database");

  if (database == null) {
    throw Exception("Database initialization failed");
  }

  // Remove Duplicates
  await DatabaseHelper.removeDuplicates();
  print("Duplicates removed");

  // Print database structure and data
  await DatabaseHelper.printDatabaseStructureAndData();

  // Register DataSources
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource(database));
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  // Register Repositories
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
    getIt<RemoteDataSource>(),
    getIt<LocalDataSource>(),
  ));

  // Register UseCases
  getIt.registerLazySingleton<FetchTasksUseCase>(() => FetchTasksUseCase(getIt<TaskRepository>()));


  getIt.registerLazySingleton<SigninRepository>(() => SigninRepositoryImpl());

  // Register SigninUseCase with its dependencies
  getIt.registerLazySingleton<SigninUseCase>(
        () => SigninUseCase(
      getIt<SigninRepository>(),       // Inject TokenRepository
      getIt<RemoteDataSource>(),      // Inject RemoteDataSource
    ),
  );
}
