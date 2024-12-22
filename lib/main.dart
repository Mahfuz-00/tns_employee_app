import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Theme/app_colors.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding%20Page/Page/Onboarding_UI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set the status bar color globally
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary, // Set the color of the status bar
      statusBarIconBrightness: Brightness.light, // Set the icon brightness (light or dark)
    ));
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
    );
  }
}
