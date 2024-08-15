// import 'dart:async';
// import 'package:all_sensors2/all_sensors2.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:final_assignment/core/common/my_snackbar.dart';
// import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';

// import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
// import 'package:final_assignment/features/profile/presentation/view_model/profile_view_model.dart';
// import 'package:final_assignment/features/profile/presentation/widgets/profile_menu.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// //import 'package:flutter_svg/flutter_svg.dart';

// class ProfileView extends ConsumerStatefulWidget {
//   const ProfileView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends ConsumerState<ProfileView> {
//   bool showYesNoDialog = true;
//   bool isDialogShowing = false;

//   List<double> _gyroscopeValues = [];
//   final List<StreamSubscription<dynamic>> _streamSubscription = [];

//   @override
//   void initState() {
//     _streamSubscription.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
//       setState(() {
//         _gyroscopeValues = <double>[event.x, event.y, event.z];

//         _checkGyroscopeValues(_gyroscopeValues);
//       });
//     }));

//     super.initState();
//   }

//   void _checkGyroscopeValues(List<double> values) async {
//     const double threshold = 4; // Example threshold value, adjust as needed
//     if (values.any((value) => value.abs() > threshold)) {
//       if (showYesNoDialog && !isDialogShowing) {
//         isDialogShowing = true;
//         final result = await AwesomeDialog(
//           context: context,
//           dialogType: DialogType.warning,
//           title: 'Logout',
//           desc: 'Are You Sure You Want To Logout?',
//           btnOkOnPress: () {
//             ref.read(authViewModelProvider.notifier).logout();
//           },
//           btnCancelOnPress: () {},
//         ).show();

//         isDialogShowing = false;
//         if (result) {
//           showMySnackBar(
//             message: 'Logged Out Successfully!',
//             backgroundColor: Colors.green,
//           );
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final profileState = ref.watch(profileViewmodelProvider);

//     if (profileState.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             profileState.isLoading
//                 ? const CircularProgressIndicator()
//                 : Text("${profileState.authEntity?.firstName}"),
//             ProfileMenu(
//               text: "${profileState.authEntity?.firstName}",
//               icon: "assets/icons/profile.svg",
//               press: () {
//                 if (mounted) {
//                   ref
//                       .read(profileViewmodelProvider.notifier)
//                       .openEditProfileView();
//                 }
//               },
//             ),
//             ProfileMenu(
//               text: "Notifications",
//               icon: "assets/icons/Bell.svg",
//               press: () {
//                 // Navigate to Notifications screen
//               },
//             ),
//             ProfileMenu(
//               text: "Change Password",
//               icon: "assets/icons/password.svg",
//               press: () {
//                 // Navigate to Settings screen
//               },
//             ),
//             ProfileMenu(
//               text: "Enable Finger Print",
//               icon: "assets/icons/fingerprint.svg",
//               press: () {
//                 if (mounted) {
//                   ref
//                       .read(profileViewmodelProvider.notifier)
//                       .enableFingerprint();
//                 }
//               },
//             ),
//             ProfileMenu(
//               text: "Log Out",
//               icon: "assets/icons/logout.svg",
//               press: () {
//                 if (mounted) {
//                   AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.warning,
//                     title: 'Logout',
//                     desc: 'Are You Sure You Want To Logout?',
//                     btnOkOnPress: () {
//                       if (mounted) {
//                         ref.read(authViewModelProvider.notifier).logout();
//                       }
//                     },
//                     btnCancelOnPress: () {},
//                   ).show();
//                 }
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.blueAccent,
//                   padding: const EdgeInsets.all(20),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   backgroundColor: Colors.blueAccent.withOpacity(0.2),
//                 ),
//                 onPressed: () {},
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 20),
//                     const Expanded(child: Text("Dark Mode/Light Mode")),
//                        Switch(
//                 value: ref.read(themeViewModelProvider),
//                 onChanged: (value) {
//                   ref.read(themeViewModelProvider.notifier).changeTheme();
//                 },
//               ),
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
import 'dart:async';
import 'package:all_sensors2/all_sensors2.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:final_assignment/features/profile/presentation/view_model/profile_view_model.dart';
import 'package:final_assignment/features/profile/presentation/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  bool showYesNoDialog = true;
  bool isDialogShowing = false;
  List<double> _gyroscopeValues = [];
  final List<StreamSubscription<dynamic>> _streamSubscription = [];

  @override
  void initState() {
    _streamSubscription.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
        _checkGyroscopeValues(_gyroscopeValues);
      });
    }));
    super.initState();
  }

  void _checkGyroscopeValues(List<double> values) async {
    const double threshold = 4;
    if (values.any((value) => value.abs() > threshold)) {
      if (showYesNoDialog && !isDialogShowing) {
        isDialogShowing = true;
        final result = await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Logout',
          desc: 'Are You Sure You Want To Logout?',
          btnOkOnPress: () {
            ref.read(authViewModelProvider.notifier).logout();
          },
          btnCancelOnPress: () {},
        ).show();

        isDialogShowing = false;
        if (result) {
          showMySnackBar(
            message: 'Logged Out Successfully!',
            backgroundColor: Colors.green,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewmodelProvider);

    if (profileState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade300, width: 1),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile_picture.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileState.authEntity?.firstName ?? 'User',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        profileState.authEntity?.email ?? 'user@example.com',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Profile Menu Items
            ProfileMenu(
              text: "Edit Profile",
              icon: "assets/icons/edit_profile.svg",
              press: () {
                ref.read(profileViewmodelProvider.notifier).openEditProfileView();
              },
            ),
            const SizedBox(height: 10),
            ProfileMenu(
              text: "Enable Finger Print",
              icon: "assets/icons/fingerprint.svg",
              press: () {
                ref.read(profileViewmodelProvider.notifier).enableFingerprint();
              },
            ),
            const SizedBox(height: 10),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/logout.svg",
              press: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  title: 'Logout',
                  desc: 'Are You Sure You Want To Logout?',
                  btnOkOnPress: () {
                    ref.read(authViewModelProvider.notifier).logout();
                  },
                  btnCancelOnPress: () {},
                ).show();
              },
            ),
            const SizedBox(height: 20),
            // Dark Mode/Light Mode Toggle
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade300, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dark Mode/Light Mode",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: ref.read(themeViewModelProvider),
                    onChanged: (value) {
                      ref.read(themeViewModelProvider.notifier).changeTheme();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
