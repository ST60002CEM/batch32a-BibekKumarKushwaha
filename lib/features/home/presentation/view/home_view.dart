
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/features/cart/presentation/view/cart_view.dart';
import 'package:final_assignment/core/common/my_snackbar.dart';

import 'package:final_assignment/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/theme_provider.dart';
import 'package:final_assignment/features/profile/presentation/view/profile_view.dart';
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
    const FavouriteView(),
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
            backgroundColor: Colors.green,
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
            : SizedBox(width: AppBar().preferredSize.width), // Adds space if no leading icon
        title: Center(
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo path
            height: AppBar().preferredSize.height - 12, // Adjust height
            fit: BoxFit.contain,
          ),
        ),
      
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

