
import 'package:final_assignment/features/auth/presentation/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("RegisterView Widget Tests", () {
    testWidgets('Register form field and button interaction', (tester) async {
  await tester.pumpWidget(
    const ProviderScope(
      child: MaterialApp(
        home: RegisterView(),
      ),
    ),
  );
  await tester.pumpAndSettle();

  // Verify that the form fields and buttons are present
  expect(find.byType(TextFormField), findsNWidgets(6)); // All input fields
  expect(find.byType(ElevatedButton), findsOneWidget); // Sign Up button

  // Fill out the registration form
  await tester.enterText(find.byType(TextFormField).at(0), 'bibek'); // First Name
  await tester.enterText(find.byType(TextFormField).at(1), 'kumar'); // Last Name
  await tester.enterText(find.byType(TextFormField).at(2), 'bibek123@gmail.com'); // Email
  await tester.enterText(find.byType(TextFormField).at(3), 'bibek123'); // Username
  await tester.enterText(find.byType(TextFormField).at(4), '9898989898'); // Phone Number
  await tester.enterText(find.byType(TextFormField).at(5), 'bibek123@'); // Password
  
  // Tap on the 'Sign Up' button
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();

  // Verify that the Sign Up button is still present (indicating the view did not change)
  expect(find.byType(ElevatedButton), findsOneWidget);
});
    testWidgets('renders RegisterView', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the RegisterView is rendered
      expect(find.byType(RegisterView), findsOneWidget);
    });

    testWidgets('displays all text fields', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify that all the text fields are displayed
      expect(find.byType(TextFormField), findsNWidgets(6));
      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Last Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Phone Number'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
    });

    testWidgets('displays all buttons', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle(); // Wait for animations to finish  
  });

    testWidgets('displays all error messages', (tester) async {
      await tester.pumpWidget( 
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),  
      );
      await tester.pumpAndSettle(); 
    }); 

    testWidgets('displays all icons', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: RegisterView(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Icon), findsNWidgets(6));
    }); 

  });
}
