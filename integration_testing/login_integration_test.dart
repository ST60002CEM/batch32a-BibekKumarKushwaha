// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../test/unit_testing/login_test.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {});

//   int getRandomInt() => Random().nextInt(200);

//   int generateRandomNumber() {
//     Map<int, bool> hasmap = {};
//     while (true) {
//       int randomValue = getRandomInt();
//       if (!hasmap.keys.contains(randomValue)) {
//         hasmap[randomValue] = true;
//         return randomValue;
//       }
//     }
//   }

//   testWidgets('Should register when the user provided details',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(home:  ()));

//     // Fill in the email and password fields
//     await tester.pumpAndSettle(Duration(seconds: 4));

//     await tester.enterText(find.byType(TextFormField).at(0), 'Test Ram'); //Name
//     await tester.enterText(
//         find.byType(TextFormField).at(1), '9845000011'); // Phone NUmber

//     await tester.enterText(find.byType(TextFormField).at(2),
//         "testram${generateRandomNumber()}@gmail.com"); // email
//     await tester.enterText(
//         find.byType(TextFormField).at(3), '123456'); // password
//     await tester.enterText(
//         find.byType(TextFormField).at(4), '123456'); // confirm password

//     // Attempt to trigger the form submission
//     await tester.tap(find.byType(ElevatedButton));
//     await tester.pumpAndSettle(Duration(seconds: 4));

//     Finder login_screen = find.byType(Scaffold);
//     expect(login_screen, findsOneWidget);
//   });

//   testWidgets('Should login when the login details are correct',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(home: LoginScreen()));

//     // Fill in the email and password fields
//     await tester.pumpAndSettle(Duration(seconds: 4));

//     await tester.enterText(find.byType(TextFormField).at(0), "admin@gmail.com");
//     await tester.enterText(find.byType(TextFormField).at(1), '123456');

//     // Attempt to trigger the form submission
//     await tester.tap(find.byType(ElevatedButton));
//     await tester.pumpAndSettle(Duration(seconds: 4));

//     Finder dashboard = find.byType(Scaffold);
//     expect(dashboard, findsOneWidget);
//   });
// }