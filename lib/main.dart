import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding%20Page/Page/Onboarding_UI.dart';

import 'Common/Bloc/bottom_navigation_with_swipe_cubit.dart';
import 'Common/Helper/local_database_helper.dart';
import 'Data/Repositories/task_repositories_impl.dart';
import 'Data/Sources/local_data_sources.dart';
import 'Data/Sources/remote_data_sources.dart';
import 'Domain/Usecases/fetch_task_usecases.dart';
import 'Presentation/Activity Dashboard Page/Bloc/task_bloc.dart';
import 'Presentation/Activity Dashboard Page/Bloc/task_event.dart';
import 'Presentation/Dashboard Page/Page/dashboard_UI.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Dependency Injection/injection.dart'
    as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Initialize the database and other dependencies
  Future<Widget> _initializeApp() async {
    // Initialize the database
    final database = await DatabaseHelper.initializeDatabase();

    // Initialize the repositories
    final localDataSource = LocalDataSource(database);
    final remoteDataSource = RemoteDataSource();
    final taskRepository =
        TaskRepositoryImpl(remoteDataSource, localDataSource);

    // Initialize the use case
    final fetchTasksUseCase = FetchTasksUseCase(taskRepository);

    return MaterialApp(
      title: 'Touch and Solve Inventory App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.containerBackgroundGrey300,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            onPrimary: AppColors.primary,
            background: AppColors.lightBackground),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
      routes: {
        '/Home': (context) => Dashboard(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use FutureBuilder to handle async initialization
    return FutureBuilder<Widget>(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the app is being initialized
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle errors if initialization fails
          return const Center(child: Text('Failed to load the app.'));
        } else {
          // Once everything is initialized, provide the TaskBloc to the app
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => BottomNavBarCubit(0)),
              BlocProvider<TaskBloc>(
                create: (context) {
                  final fetchTasksUseCase =
                      di.getIt<FetchTasksUseCase>(); // DI resolve here
                  final taskBloc = TaskBloc(fetchTasksUseCase);
                  taskBloc.add(
                      LoadTasksEvent()); // Add the event right after Bloc initialization
                  return taskBloc;
                },
              ),
            ],
            child: snapshot.data!,
          );
        }
      },
    );
  }
}
