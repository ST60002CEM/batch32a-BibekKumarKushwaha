import 'package:final_assignment/features/auth/presentation/view/register_view.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:final_assignment/features/auth/presentation/widgets/ui_helper.dart';
import 'package:final_assignment/features/auth/presentation/widgets/zizzag.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 233, 241),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: ZigZagPainter(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 260.0, 16.0, 0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24.0),
                        buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        buildMainLoginButton(
                          'Log In',
                          Colors.blue[800]!,
                          () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authViewModelProvider.notifier)
                                  .loginUser(_emailController.text,
                                      _passwordController.text);
                            }
                          },
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          'Or log in with',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        buildSocialLoginButton(
                          'Log In with Facebook',
                          'assets/images/fb_logo.png',
                          Colors.blue[800]!,
                          () {
                            // Perform Facebook login action
                          },
                        ),
                        const SizedBox(height: 16.0),
                        buildSocialLoginButton(
                          'Log In with Google',
                          'assets/images/google_logo.png',
                          Colors.red,
                          () {
                            // Perform Google login action
                          },
                        ),
                        const SizedBox(height: 16.0),
                        buildSocialLoginButton(
                          'Log In with Apple',
                          'assets/images/mac_logo.png',
                          Colors.black,
                          () {
                            // Perform Apple login action here
                          },
                        ),
                        const SizedBox(height: 24.0),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
