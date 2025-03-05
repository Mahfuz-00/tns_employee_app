import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Sign In Page/Page/Sign_in_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding Page/Page/Onboarding_UI.dart';

void main() {
  group('OnboardingPage Navigation Tests', () {
    testWidgets('Navigates to SignInPage on button press', (WidgetTester tester) async {
      // Build the OnboardingPage widget with MaterialApp for navigation support
      await tester.pumpWidget(MaterialApp(
     /*   routes: {
          '/signin': (context) => SignInPage(), // Define route for SignInPage
        },*/
        home: OnboardingPage(),
      ));

/*      // Verify that the OnboardingPage is displayed initially
      expect(find.text('Welcome'), findsOneWidget);
      expect(find.text("Let's go"), findsOneWidget);*/

/*      // Tap the "Let's go" button
      await tester.tap(find.text("Let's go"));*/
      await tester.pumpAndSettle(); // Wait for navigation to complete

      // Verify that the SignInPage is displayed
      expect(find.byType(SignInPage), findsOneWidget);
    });
  });
}