import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(loginViewNavigatorProvider),
    ref.read(authUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.navigator, this.authUseCase) : super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;
  late LocalAuthentication _localAuth;

  Future<void> registerUser(AuthEntity student) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(student);
    // data.fold(
    //   (failure) {
    //     state = state.copyWith(
    //       isLoading: false,
    //       error: failure.error,
    //     );
    //     showMySnackBar(message: failure.error, backgroundColor: Colors.red);
    //   },
    //   (success) {
    //     state = state.copyWith(isLoading: false, error: null);
    //     showMySnackBar(message: "Successfully registered", backgroundColor: Colors.green);
    //   },
    // );
  }

  Future<void> loginUser(
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, backgroundColor: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        openHomeView();
      },
    );
  }

  void openRegisterView() {
    navigator.openRegisterView();
  }

  void openHomeView() {
    navigator.openHomeView();
  }
  Future<void> fingerPrintLogin() async {
    _localAuth = LocalAuthentication();
 
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to enable fingerprint',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      showMySnackBar(
          message: 'Fingerprint authentication failed', backgroundColor: Colors.red);
    }
 
    if (authenticated) {
      authUseCase.fingerPrintLogin().then((data) {
        data.fold(
          (l) {
            showMySnackBar(message: l.error, backgroundColor: Colors.red);
          },
          (r) {
            showMySnackBar(message: "User logged in successfully", backgroundColor: Colors.green);
            navigator.openHomeView();
          },
        );
      });
    } else {
      showMySnackBar(
          message: 'Fingerprint authentication failed', backgroundColor: Colors.red);
    }
  }
    void logout() async {
    navigator.openLoginView();
  }
 
}
