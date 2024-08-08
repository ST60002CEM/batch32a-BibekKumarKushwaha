// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:final_assignment/features/home/presentation/viewmodel/products_view_model.dart';
// import 'package:final_assignment/features/home/presentation/widgets/my_product_cart.dart';

// class DashboardView extends ConsumerStatefulWidget {
//   const DashboardView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends ConsumerState<DashboardView> {
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';
//   String _selectedSortOption = 'None';

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(productViewModelProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
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
                
//                 const SizedBox(height: 20),
//                 _buildSearchBar(),
//                 const SizedBox(height: 20),
//                 _buildSortOptions(),
//                 const SizedBox(height: 20),
//                 _buildProductCarousel(),
//                 const SizedBox(height: 20),
//                 _buildProductGrid(state),
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

 

//   Widget _buildSearchBar() {
//     return TextField(
//       controller: _searchController,
//       decoration: InputDecoration(
//         hintText: 'Search products...',
//         prefixIcon: const Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//       onChanged: (query) {
//         setState(() {
//           _searchQuery = query;
//         });
//       },
//     );
//   }

//   Widget _buildSortOptions() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           'Sort by:',
//           style: TextStyle(fontSize: 16),
//         ),
//         DropdownButton<String>(
//           value: _selectedSortOption,
//           items: <String>['None', 'Price: Low to High', 'Price: High to Low']
//               .map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             setState(() {
//               _selectedSortOption = newValue!;
//             });
//           },
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

//   Widget _buildProductGrid(dynamic state) {
//     if (state.products.isEmpty) {
//       return const Center(child: Text('No products available.'));
//     }

//     final filteredProducts = state.products.where((product) {
//       return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
//     }).toList();

//     if (_selectedSortOption == 'Price: Low to High') {
//       filteredProducts.sort((a, b) => a.price.compareTo(b.price));
//     } else if (_selectedSortOption == 'Price: High to Low') {
//       filteredProducts.sort((a, b) => b.price.compareTo(a.price));
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
//       itemCount: filteredProducts.length,
//       itemBuilder: (context, index) {
//         final product = filteredProducts[index];
//         return MyProductCard(product: product);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/products_view_model.dart';
import 'package:final_assignment/features/home/presentation/widgets/my_product_cart.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
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
                _buildProductCarousel(),
                const SizedBox(height: 20),
                _buildProductGrid(state),
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
              'Hello, admin!',
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

  Widget _buildProductGrid(dynamic state) {
    if (state.products.isEmpty) {
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
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final product = state.products[index];
        return MyProductCard(product: product);
      },
    );
  }
}
