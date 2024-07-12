// import 'dart:math';

// import 'package:flutter/widgets.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   setUp(() async {
//     SharedPreferences.setMockInitialValues({"login": ""});
//   });

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

//   test("User must able to register", () async {
//     bool expectedResult = true;
//     User testUser = User("Ram Kumar", "testram${generateRandomNumber()}@gmail.com",
//         "123456", null, null, null, null, null, null);
//     bool actualResult = await UserAPI().registerUser(testUser);
//     expect(actualResult, expectedResult);
//   });

//   test("User must able to login", () async {
//     bool expectedResult = true;
//     String email = "admin@gmail.com";  // tmro email yesma 
//     String password = "admin123"; // tmro
//     bool actualResult = await UserAPI().loginUser(email, password);
//     expect(actualResult, expectedResult);
//   });

// }

// class User {
//   User(String s, String t, String u, param3, param4, param5, param6, param7, param8);
// }

// class UserAPI {
//   loginUser(String email, String password) {}
  
//   registerUser(testUser) {}
// }
import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
 
import 'auth_test.mocks.dart';
 
@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  MockSpec<RegisterViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
 
  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;
 
  setUp(() {
    mockAuthUsecase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockLoginViewNavigator, mockAuthUsecase),
        ),
      ],
    );
  });
  tearDown(
    () {
      container.dispose();
    },
  );
 
  test("Checking Initial State", () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });
  test("Login with valid credentials", () async {
    //Arrange
    const correctEmail = 'admin@gmail.com';
    const correctPassword = 'admin123';
 
    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(email == correctEmail && password == correctPassword
          ? const Right(true)
          : Left(Failure(error: 'Invalid')));
    });
    //Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser("admin@gmail.com", "admin123");
 
    final authState = container.read(authViewModelProvider);
 
    //Assert
    expect(authState.error, isNull);
  });
  test("Register user with valid credentials", () async {
    //Arrange
    when(mockAuthUsecase.registerUser(any)).thenAnswer((invocation) {
      final student = invocation.positionalArguments[0] as AuthEntity;
      return Future.value(
        student.firstName.isNotEmpty &&
                student.lastName.isNotEmpty &&
                student.email.isNotEmpty &&
                student.password.isNotEmpty &&
                student.email.contains('@') &&
                student.email.contains('.') &&
                student.phone.length == 10
            ? const Right(true)
            : Left(
                Failure(error: 'Invalid'),
              ),
      );
    });
 
    //Act
    await container
        .read(authViewModelProvider.notifier)
        .registerUser(const AuthEntity(
          firstName: 'admin',
          lastName: 'admin',
          email: 'admin@gmail',
          phone: '1234567890',
          password: 'admin123',
        ));
 
    final state = container.read(authViewModelProvider);
 
    //Assert
    expect(state.isLoading, true);
    expect(state.error, null);
  });
  tearDown((){
    container.dispose();
  });
}