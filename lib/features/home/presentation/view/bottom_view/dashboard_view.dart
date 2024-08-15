
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:final_assignment/core/common/widgets/my_search_container.dart';
// import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
// import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
// import 'package:final_assignment/features/home/presentation/widgets/my_product_cart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:final_assignment/features/home/presentation/viewmodel/products_view_model.dart';
// import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
//  // Import your search container

// class DashboardView extends ConsumerStatefulWidget {
//   const DashboardView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends ConsumerState<DashboardView> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(productViewModelProvider);
//     final cartViewModel = ref.read(cartViewModelProvider.notifier);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         actions: [
//           Switch(
//             value: ref.read(themeViewModelProvider),
//             onChanged: (value) {
//               ref.read(themeViewModelProvider.notifier).changeTheme();
//             },
//           ),
//         ],
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (notification) {
//           if (notification is ScrollEndNotification &&
//               _scrollController.position.extentAfter == 0) {
//             ref.read(productViewModelProvider.notifier).getProducts();
//           }
//           return true;
//         },
//         child: RefreshIndicator(
//           onRefresh: () async {
//             await ref.read(productViewModelProvider.notifier).getProducts();
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(
//               controller: _scrollController,
//               children: [
//                 _buildHeader(),
//                 const SizedBox(height: 20),
//                 const MySearchContainer(
//                   text: 'Search products...',
//                   icon: Icons.search,
//                   showBackground: true,
//                   showBorder: true,
//                 ),
//                 const SizedBox(height: 20),
//                 _buildProductCarousel(),
//                 const SizedBox(height: 20),
//                 _buildProductGrid(state, cartViewModel),
//                 if (state.isLoading)
//                   const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.red,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return const Row(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundImage: AssetImage('assets/images/profile_picture.png'),
//         ),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hello, Bibek!',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Welcome back!',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildProductCarousel() {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 200,
//         autoPlay: true,
//         enlargeCenterPage: true,
//         aspectRatio: 2.0,
//       ),
//       items: [
//         'https://img.freepik.com/free-psd/black-friday-super-sale-facebook-cover-template_106176-1568.jpg',
//         'https://img.freepik.com/premium-psd/super-sale-promotion-social-media-3d-render-template-design-banner-template_502896-377.jpg',
//         'https://img.freepik.com/premium-vector/blue-orange-home-appliances-social-media-square-banner-template-design-unique-post_958026-66.jpg',
//       ].map((imageUrl) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               margin: const EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: const BoxDecoration(
//                 color: Colors.amber,
//               ),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildProductGrid(dynamic state, CartViewModel cartViewModel) {
//     if (state.products.isEmpty) {
//       return const Center(child: Text('No products available.'));
//     }

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 0.75,
//       ),
//       itemCount: state.products.length,
//       itemBuilder: (context, index) {
//         final product = state.products[index];
//         return MyCard(
//           productEntity: product,
//           onPressed: () {
//             ref.read(cartViewModelProvider.notifier).addCart(product.id!, 1, 1);
//           },
//         );
//       },
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_assignment/core/common/widgets/my_search_container.dart'; // Ensure this is updated or replaced with CustomSearchBar if needed
import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/features/home/presentation/widgets/my_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/products_view_model.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);
    final cartViewModel = ref.read(cartViewModelProvider.notifier);

    // Filter products based on search query
    final filteredProducts = state.products.where((product) {
      final productName = product.productName.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return productName.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Switch(
            value: ref.read(themeViewModelProvider),
            onChanged: (value) {
              ref.read(themeViewModelProvider.notifier).changeTheme();
            },
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              _scrollController.position.extentAfter == 0) {
            ref.read(productViewModelProvider.notifier).getProducts();
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(productViewModelProvider.notifier).getProducts();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              controller: _scrollController,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildSearchBar(),
                const SizedBox(height: 20),
                _buildProductCarousel(),
                const SizedBox(height: 20),
                _buildProductGrid(filteredProducts, cartViewModel),
                if (state.isLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile_picture.png'),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Bibek!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (query) {
        setState(() {
          _searchQuery = query;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildProductCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
      items: [
        'https://img.freepik.com/free-psd/black-friday-super-sale-facebook-cover-template_106176-1568.jpg',
        'https://img.freepik.com/premium-psd/super-sale-promotion-social-media-3d-render-template-design-banner-template_502896-377.jpg',
        'https://img.freepik.com/premium-vector/blue-orange-home-appliances-social-media-square-banner-template-design-unique-post_958026-66.jpg',
      ].map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildProductGrid(List<ProductEntity> products, CartViewModel cartViewModel) {
    if (products.isEmpty) {
      return const Center(child: Text('No products available.'));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return MyCard(
          productEntity: product,
          onPressed: () {
            ref.read(cartViewModelProvider.notifier).addCart(product.id!, 1, 1);
          },
        );
      },
    );
  }
}
