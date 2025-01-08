import 'package:touch_and_solve_inventory_app/Data/Repositories/activity_repositories_impl.dart';
import 'package:touch_and_solve_inventory_app/Domain/Usecases/activity_usecases.dart';
import 'package:touch_and_solve_inventory_app/Data/Sources/local_data_sources.dart';
import 'package:touch_and_solve_inventory_app/Data/Sources/remote_data_sources.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../Common/Helper/local_database_helper.dart';
import '../../../Data/Repositories/activity_form_repositories_impl.dart';
import '../../../Data/Repositories/attendance_form_repositories_impl.dart';
import '../../../Data/Repositories/leave_form_repositories_impl.dart';
import '../../../Data/Repositories/sign_in_repositories_impl.dart';
import '../../../Data/Sources/activity_form_remote_source.dart';
import '../../../Data/Sources/attendance_form_remote_source.dart';
import '../../../Data/Sources/leave_form_remote_source.dart';
import '../../../Domain/Repositories/activity_form_repositories.dart';
import '../../../Domain/Repositories/attendance_form_repositories.dart';
import '../../../Domain/Repositories/leave_form_repositories.dart';
import '../../../Domain/Repositories/sign_in_repositories.dart';
import '../../../Domain/Repositories/activity_repositories.dart';
import '../../../Domain/Usecases/activity_form_usercase.dart';
import '../../../Domain/Usecases/attendance_form_usecase.dart';
import '../../../Domain/Usecases/leave_form_usecase.dart';
import '../../../Domain/Usecases/sign_in_usercases.dart';
import '../../../Presentation/Activity Creation Page/Bloc/activity_form_bloc.dart';
import '../../../Presentation/Attendance Dashboard Page/Bloc/attendance_form_bloc.dart';
import '../../../Presentation/Leave Creation Page/Bloc/leave_form_bloc.dart';

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

  // **11. Register External Dependencies**
  getIt.registerLazySingleton(
          () => http.Client()); // HTTP client for making network requests.


  //Activity Dashboard
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


  //Activity Form
  // **8. Register ActivityFormUseCase (first)**
  getIt.registerLazySingleton<ActivityFormUseCase>(
          () => ActivityFormUseCase(getIt())); // Create activity use case.

  // **9. Register ActivityFormBloc (depends on ActivityFormUseCase)**
  getIt.registerFactory(() =>
      ActivityFormBloc(getIt<ActivityFormUseCase>())); // Inject the correct use case.

  // **10. Register Repository**
  getIt.registerLazySingleton<ActivityFormRepository>(
        () => ActivityFormRepositoryImpl(getIt()), // Inject activity repository.
  );

  // **12. Register Remote Sources**
  getIt.registerLazySingleton(() => ActivityFormRemoteDataSource(
      getIt())); // Activity remote data source depends on HTTP client.

  final client = http.Client();

  //Leave Form
  // Leave Form Dependencies
  getIt.registerLazySingleton<LeaveFormRemoteSource>(
        () => LeaveFormRemoteSource(getIt()),
  );

  getIt.registerLazySingleton<LeaveFormRepository>(
        () => LeaveFormRepositoryImpl(getIt<RemoteDataSource>()),
  );

  getIt.registerLazySingleton<SubmitLeaveFormUseCase>(
        () => SubmitLeaveFormUseCase(getIt<LeaveFormRepository>()),
  );

  getIt.registerFactory<LeaveFormBloc>(
        () => LeaveFormBloc(submitLeaveFormUseCase: getIt<SubmitLeaveFormUseCase>()),
  );


  //Attendance Form Submission

  // Register AttendanceRemoteDataSourceImpl with Dio as a dependency
  getIt.registerLazySingleton<AttendanceFormRemoteDataSource>(() => AttendanceFormRemoteDataSource(getIt()));

  // Register AttendanceRepositoryImpl with RemoteDataSource
  getIt.registerLazySingleton<AttendanceFormRepository>(() => AttendanceFormRepositoryImpl(remoteDataSource: getIt()));

  // Register AttendanceUseCase with the repository
  getIt.registerLazySingleton(() => AttendanceFormUseCase(repository: getIt()));

  // Register AttendanceBloc with the use case
  getIt.registerFactory(() => AttendanceFormBloc(attendanceFormUseCase: getIt()));

}
