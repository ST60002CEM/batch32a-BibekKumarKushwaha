
import 'package:final_assignment/features/auth/presentation/view/login_view.dart';
import 'package:final_assignment/features/forget_password/presentation/view/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("LoginView Widget Tests", () {
    testWidgets('renders LoginView', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(LoginView), findsOneWidget);
    });

    testWidgets('Login screen - displays email and password fields', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('Login screen - Forgot Password navigation', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Forgot Password?'));
      await tester.pumpAndSettle();
      expect(find.byType(ForgetPasswordView), findsOneWidget);
    });


    testWidgets('Login screen - Fingerprint login button', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.fingerprint), findsOneWidget);
      await tester.tap(find.byIcon(Icons.fingerprint));
      await tester.pumpAndSettle();

      // Add additional expectations for the fingerprint login action if needed
    });

    testWidgets('Login screen - Login button', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginView(),
          ),
        ),
      );
      await tester.pumpAndSettle(); // Wait for animations to finish      
  });
});
}
