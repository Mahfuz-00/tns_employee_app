import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Sign In Page/Page/Sign_in_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding Page/Page/Onboarding_UI.dart';

void main() {
  group('OnboardingPage Widget Tests', () {
    testWidgets('Renders all key widgets', (WidgetTester tester) async {
      // Build the OnboardingPage widget
      await tester.pumpWidget(MaterialApp(
        home: OnboardingPage(),
      ));

      // Verify the presence of key widgets
      expect(find.byType(Image), findsOneWidget); // TNSLogoMedium image
      expect(find.text('Welcome'), findsOneWidget);
      expect(find.text('To our Touch and Solve Family!'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Verify the button text
      expect(find.text("Let's go"), findsOneWidget);
    });

    testWidgets('Navigates to SignInPage on button press', (WidgetTester tester) async {
      // Build the OnboardingPage widget
      await tester.pumpWidget(MaterialApp(
        routes: {
          '/signin': (context) => SignInPage(), // Mock route for SignInPage
        },
        home: OnboardingPage(),
      ));

      // Tap the "Let's go" button
      await tester.tap(find.text("Let's go"));
      await tester.pumpAndSettle(); // Wait for navigation to complete

      // Verify that the SignInPage is displayed
      expect(find.byType(SignInPage), findsOneWidget);
    });
  });
}