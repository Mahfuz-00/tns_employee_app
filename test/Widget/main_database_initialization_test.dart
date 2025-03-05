import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding%20Page/Page/Onboarding_UI.dart';
import 'package:touch_and_solve_inventory_app/main.dart'; // Import your main file
import 'package:touch_and_solve_inventory_app/Common/Helper/local_database_helper.dart';

// Mock the DatabaseHelper class
class MockDatabaseHelper extends Mock implements DatabaseHelper {
  @override
  Future<void> initializeDatabase() async {
    print('Database initialization Started');
    // Simulate database initialization
    await Future.delayed(Duration(milliseconds: 100)); // Simulate delay
    print('Database initialization Complete');
  }
}

void main() {
  late MockDatabaseHelper mockDatabaseHelper;

  // Setup: Initialize mocks and dependencies
  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
  });

  // Do: Simulate database initialization
/*  Future<void> simulateDatabaseInitialization() async {
    // Mock the initializeDatabase method to return a Future
    when(mockDatabaseHelper.initializeDatabase())
        .thenAnswer((_) async => Future.value());
  }*/

  // Test: Verify database initialization and app navigation
  testWidgets('Verify database initialization and navigation to OnboardingPage',
          (WidgetTester tester) async {
        // Simulate database initialization
        // await simulateDatabaseInitialization();

        // Build the app from the main entry point
        await tester.pumpWidget(const MyApp());

        // Wait for all asynchronous tasks to complete
        await tester.pumpAndSettle();

        // Verify that the database initialization was called
        verify(mockDatabaseHelper.initializeDatabase()).called(1);

     /*   // Verify that the OnboardingPage is displayed
        expect(find.byType(OnboardingPage), findsOneWidget);

        // Optionally, check for specific widgets or text on the OnboardingPage
        expect(find.text('Welcome'), findsOneWidget); // Replace with actual text on OnboardingPage*/
      });
}