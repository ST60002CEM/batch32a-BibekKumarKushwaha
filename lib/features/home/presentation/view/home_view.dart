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
import 'package:final_assignment/features/home/presentation/viewmodel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/cart_view.dart';
import 'package:final_assignment/features/home/presentation/view/bottom_view/wishlist_view.dart';


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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.watch(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Implement your sliding menu functionality here
              },
            ),
            const SizedBox(width: 16), // Adjust spacing as needed
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png', // Replace with your photo path
                  height: AppBar().preferredSize.height - 12, // Adjust height
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16), // Adjust spacing as needed
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
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
