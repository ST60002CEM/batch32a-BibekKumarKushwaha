// import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
// import 'package:final_assignment/features/auth/presentation/view/login_view.dart';
// import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
// import 'package:final_assignment/features/auth/presentation/widgets/ui_helper.dart';
// import 'package:final_assignment/features/auth/presentation/widgets/zizzag.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class RegisterView extends ConsumerStatefulWidget {
//   const RegisterView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends ConsumerState<RegisterView> {
//   final _formKey = GlobalKey<FormState>();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 223, 233, 241),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             CustomPaint(
//               painter: ZigZagPainter(),
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.35,
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 50.0),
//                     child: Image.asset(
//                       'assets/images/logo.png',
//                       height: 100,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(16.0, 260.0, 16.0, 0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 32.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[800],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 24.0),
//                     buildTextField(
//                       controller: _firstNameController,
//                       label: 'First Name',
//                       icon: Icons.person,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your first name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16.0),
//                     buildTextField(
//                       controller: _lastNameController,
//                       label: 'Last Name',
//                       icon: Icons.person,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your last name';
//                         }
//                         return null;
//                       },
//                     ),
                    
//                     const SizedBox(height: 16.0),
//                     buildTextField(
//                       controller: _emailController,
//                       label: 'Email',
//                       icon: Icons.email,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter an email';
//                         }
//                         if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16.0),
//                     buildPasswordField(
//                       controller: _passwordController,
//                       label: 'Password',
//                       icon: Icons.lock,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a password';
//                         }
//                         if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16.0),
//                     buildPasswordField(
//                       controller: _confirmPasswordController,
//                       label: 'Confirm Password',
//                       icon: Icons.lock,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please confirm your password';
//                         }
//                         if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 24.0),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.blue[800],
//                         padding: const EdgeInsets.symmetric(vertical: 16.0),
//                         textStyle: const TextStyle(fontSize: 16.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Perform sign up action
//                           AuthEntity student = AuthEntity(
//                               firstName: _firstNameController.text,
//                               lastName: _lastNameController.text,
//                               phone: '1234567890',
//                               email: _emailController.text,
//                               password: _passwordController.text);

//                           ref
//                               .read(authViewModelProvider.notifier)
//                               .registerUser(student);
//                         }
//                       },
//                       child: const Text('Sign Up'),
//                     ),
//                     const SizedBox(height: 24.0),
//                     Text(
//                       'Or sign up with',
//                       style: TextStyle(
//                         color: Colors.blue[800],
//                         fontSize: 16.0,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16.0),
//                     buildSocialLoginButton(
//                       'Sign Up with Facebook',
//                       'assets/images/fb_logo.png',
//                       Colors.blue[800]!,
//                       () {
//                         // Perform Facebook signup action
//                       },
//                     ),
//                     const SizedBox(height: 16.0),
//                     buildSocialLoginButton(
//                       'Sign Up with Google',
//                       'assets/images/google_logo.png',
//                       Colors.red,
//                       () {
//                         // Perform Google signup action
//                       },
//                     ),
//                     const SizedBox(height: 16.0),
//                     buildSocialLoginButton(
//                       'Sign Up with Apple',
//                       'assets/images/mac_logo.png',
//                       Colors.black,
//                       () {
//                         // Perform Apple signup action
//                       },
//                     ),
//                     const SizedBox(height: 24.0),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginView()),
//                         );
//                       },
//                       child: RichText(
//                         text: const TextSpan(
//                           text: "Already have an account? ",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16.0,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'Login',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16.0,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/presentation/view/login_view.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:final_assignment/features/auth/presentation/widgets/zizzag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController(); // Added phone controller

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose(); // Dispose phone controller
    super.dispose();
  }

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
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 260.0, 16.0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24.0),
                    buildTextField(
                      controller: _firstNameController,
                      label: 'First Name',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildTextField(
                      controller: _lastNameController,
                      label: 'Last Name',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildTextField(
                      controller: _phoneController, // Phone text field
                      label: 'Phone Number',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildPasswordField(
                      controller: _passwordController,
                      label: 'Password',
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildPasswordField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: const TextStyle(fontSize: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform sign up action
                          AuthEntity student = AuthEntity(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              phone: int.tryParse( _phoneController.text)??0, // Use entered phone number
                              email: _emailController.text,
                              password: _passwordController.text);

                          ref
                              .read(authViewModelProvider.notifier)
                              .registerUser(student);
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      'Or sign up with',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    buildSocialLoginButton(
                      'Sign Up with Facebook',
                      'assets/images/fb_logo.png',
                      Colors.blue[800]!,
                      () {
                        // Perform Facebook signup action
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildSocialLoginButton(
                      'Sign Up with Google',
                      'assets/images/google_logo.png',
                      Colors.red,
                      () {
                        // Perform Google signup action
                      },
                    ),
                    const SizedBox(height: 16.0),
                    buildSocialLoginButton(
                      'Sign Up with Apple',
                      'assets/images/mac_logo.png',
                      Colors.black,
                      () {
                        // Perform Apple signup action
                      },
                    ),
                    const SizedBox(height: 24.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
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
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget buildPasswordField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      obscureText: true,
      validator: validator,
    );
  }

  Widget buildSocialLoginButton(String text, String asset, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        textStyle: const TextStyle(fontSize: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Image.asset(
        asset,
        height: 24.0,
        width: 24.0,
      ),
      label: Text(text),
      onPressed: onPressed,
    );
  }
}
