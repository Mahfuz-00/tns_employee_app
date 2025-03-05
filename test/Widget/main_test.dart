import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding%20Page/Page/Onboarding_UI.dart';
import 'package:touch_and_solve_inventory_app/main.dart'; // Import your main file

void main() {
  testWidgets('Navigate from main to OnboardingPage', (WidgetTester tester) async {
    // Build the app from the main entry point
    await tester.pumpWidget(const MyApp());

    // Wait for all asynchronous tasks to complete
    await tester.pumpAndSettle();

    // Verify that the OnboardingPage is displayed
    expect(find.byType(OnboardingPage), findsOneWidget);

    // Optionally, check for specific widgets on the OnboardingPage
    // expect(find.text('Welcome'), findsOneWidget); // Replace with actual text on OnboardingPage
  });
}