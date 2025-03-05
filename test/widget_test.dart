// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:touch_and_solve_inventory_app/Domain/Entities/voucher_entites.dart';
import 'package:touch_and_solve_inventory_app/Domain/Usecases/voucher_usecase.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Onboarding%20Page/Page/Onboarding_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Voucher%20Dashboard%20Page/Bloc/voucher_bloc.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Voucher%20Dashboard%20Page/Page/voucher_dashboard_UI.dart';
import 'package:touch_and_solve_inventory_app/Presentation/Voucher%20Dashboard%20Page/Widgets/voucher_container_card.dart';

import 'package:touch_and_solve_inventory_app/main.dart';
import 'package:touch_and_solve_inventory_app/Core/Config/Dependency Injection/injection.dart'
as di;

/// --- Tests for VoucherDashboard --- ///

void main() {
/*  TestWidgetsFlutterBinding.ensureInitialized();

  group('Main Function', () {
   *//* testWidgets('should run app without errors', (tester) async {
      // Mock dependency initialization
      when(() => di.init()).thenAnswer((_) async {});

      // Build and run the app
      await tester.pumpWidget(const MyApp());

      // Verify initialization occurred
      verify(() => di.init()).called(1);
    });
  });*/



/*  group('App Initialization', () {
    testWidgets('App starts and shows onboarding screen', (tester) async {
      // Ensure that the MaterialApp is properly initialized
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle(); // Wait for the async operations to finish

      // Assert that the OnboardingPage is shown
      expect(find.byType(OnboardingPage), findsOneWidget);
    });
  });*/


/*  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/
}
