// import 'package:final_assignment/features/home/presentation/view/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'package:mockito/mockito.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:final_assignment/features/home/presentation/viewmodel/theme_provider.dart';

// // Mock class for GyroscopeEvent
// class MockGyroscopeEvent extends Mock implements GyroscopeEvent {}

// void main() {
//   group('HomeView widget test', () {
//     // Mock the necessary dependencies
//     final mockThemeProvider = MockThemeProvider();
//     final mockNotifier = MockNotifierProvider<ThemeProvider>(mockThemeProvider);

//     testWidgets('Widget renders correctly', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         ProviderScope(
//           overrides: [
//             themeProvider.notifier.overrid7eWithValue(mockNotifier),
//           ],
//           child: MaterialApp(
//             home: HomeView(),
//           ),
//         ),
//       );

//       // Verify that the widget tree is correctly built
//       expect(find.byType(HomeView), findsOneWidget);
//       expect(find.byType(AppBar), findsOneWidget);
//       expect(find.byType(BottomNavigationBar), findsOneWidget);
//     });

//     testWidgets('Gyroscope triggers dialog on threshold', (WidgetTester tester) async {
//       // Mock Gyroscope events
//       final mockEvent = MockGyroscopeEvent();
//       when(mockEvent.x).thenReturn(6.0); // Set values to trigger the dialog

//       await tester.pumpWidget(
//         ProviderScope(
//           overrides: [
//             gyroscopeEvents.overrideWithValue(Stream<GyroscopeEvent>.fromIterable([mockEvent])),
//             themeProvider.notifier.overrideWithValue(mockNotifier),
//           ],
//           child: MaterialApp(
//             home: HomeView(),
//           ),
//         ),
//       );

//       // Wait for dialog to appear
//       await tester.pumpAndSettle();

//       // Verify that the dialog is shown
//       expect(find.byType(AwesomeDialog), findsOneWidget);

//       // Simulate tapping the "OK" button on the dialog
//       await tester.tap(find.text('OK'));
//       await tester.pumpAndSettle();

//       // Verify that the snackbar appears after dismissing the dialog
//       expect(find.byType(SnackBar), findsOneWidget);
//       expect(find.text('Logged Out Successfully!'), findsOneWidget);
//     });
//   });
// }

// class ThemeProvider {
// }

// // Mock classes for testing
// class MockThemeProvider extends Mock implements ThemeProvider {}

// class MockNotifierProvider<T> extends Mock implements ChangeNotifierProvider<T> {
//   MockNotifierProvider(MockThemeProvider mockThemeProvider);
// }
