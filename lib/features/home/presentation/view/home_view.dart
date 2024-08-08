// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:final_assignment/features/home/presentation/view/bottom_view/dashboard_view.dart';
// import 'package:final_assignment/features/home/presentation/view/bottom_view/profile_view.dart';
// import 'package:final_assignment/features/home/presentation/view/bottom_view/cart_view.dart';
// import 'package:final_assignment/features/home/presentation/view/bottom_view/wishlist_view.dart';

// class HomeView extends ConsumerStatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends ConsumerState<HomeView> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const DashboardView(),
//     const WishlistView(),
//     const CartView(),
//     const ProfileView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 // Implement your sliding menu functionality here
//               },
//             ),
//             const SizedBox(width: 16), // Adjust spacing as needed
//             Expanded(
//               child: Center(
//                 child: Image.asset(
//                   'assets/images/logo.png', // Replace with your photo path
//                   height: AppBar().preferredSize.height - 12, // Adjust height
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16), // Adjust spacing as needed
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings), // Change to settings icon
//             onPressed: () {
//               // Handle settings button action
//             },
//           ),
//         ],
//       ),
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black, // Set selected icon color
//         unselectedItemColor: Colors.black, // Set unselected icon color
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/theme_provider.dart';
import 'package:final_assignment/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/cart_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/wishlist_view.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardView(),
    const WishlistView(),
    const CartView(),
    const ProfileView(),

  ];
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
    const double threshold = 0.5; // Example threshold value, adjust as needed
    if (values.any((value) => value.abs() > threshold)) {
      if (showYesNoDialog && !isDialogShowing) {
        isDialogShowing = true;
        final result = await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Logout',
          desc: 'Are You Sure You Want To Logout?',
          btnOkOnPress: () {
            ref.read(homeViewModelProvider.notifier).logout();
          },
          btnCancelOnPress: () {},
        ).show();

        isDialogShowing = false;
        if (result) {
          showMySnackBar(
            message: 'Logged Out Successfully!',
            color: Colors.green,
          );
        }
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onBackPressed() {
    setState(() {
      if (_selectedIndex > 0) {
        _selectedIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.watch(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: _selectedIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _onBackPressed,
              )
            : null,
        title: Center(
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo path
            height: AppBar().preferredSize.height - 12, // Adjust height
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.black),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
