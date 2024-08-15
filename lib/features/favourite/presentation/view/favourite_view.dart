// import 'package:final_assignment/app/constants/api_endpoint.dart';
// import 'package:final_assignment/core/common/my_snackbar.dart';
// import 'package:final_assignment/features/favouritedoctors/domain/entity/favourite_entity.dart';
// import 'package:final_assignment/features/favourite/presentation/viewmodel/favourite_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class FavouriteProductView extends ConsumerStatefulWidget {
//   const FavouriteProductView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _FavouriteProductViewState();
// }

// class _FavouriteProductViewState extends ConsumerState<FavouriteProductView> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(favouriteProductViewModelProvider.notifier).fetchFavouriteProducts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(favouriteProductViewModelProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favourite Products'),
//         elevation: 0,
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           await ref.read(favouriteProductViewModelProvider.notifier).fetchFavouriteProducts();
//         },
//         child: _buildBody(state),
//       ),
//     );
//   }

//   Widget _buildBody( state) {
//     if (state.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (state.error != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Error: ${state.error}', textAlign: TextAlign.center),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(favouriteProductViewModelProvider.notifier).fetchFavouriteProducts();
//               },
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     } else if (state.favouriteProducts.isEmpty) {
//       return const Center(
//         child: Text(
//           'No favourite products',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//       );
//     } else {
//       return ListView.builder(
//         itemCount: state.favouriteProducts.length,
//         itemBuilder: (context, index) {
//           final productId = state.favouriteProducts[index];
//           return _buildProductCard(product);
//         },
//       );
//     }
//   }

//   Widget _buildProductCard(FavouriteEntity productId) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Slidable(
//         key: Key(productId.productId.productid!),
//         endActionPane: ActionPane(
//           motion: const ScrollMotion(),
//           dismissible: DismissiblePane(onDismissed: () {
//             ref.read(favouriteProductViewModelProvider.notifier).removeFavouriteProduct(productId.id);
//             showMySnackBar(message: 'prodcut removed from favourites', backgroundColor: Colors.red);
//           }),
//           children: [
//             SlidableAction(
//               onPressed: (context) {
//                 ref.read(favouriteProductViewModelProvider.notifier).removeFavouriteProduct(productId.id);
//             showMySnackBar(message: 'product removed from favourites', backgroundColor: Colors.red);

//               },
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//               icon: Icons.delete,
//               label: 'Remove',
//             ),
//           ],
//         ),
//         child: Card(
//           elevation: 2,
//           child: ListTile(
//             contentPadding: const EdgeInsets.all(16),
//             leading: CircleAvatar(
//               radius: 30,
//               backgroundImage: NetworkImage(ApiEndpoints.imageUrl +productId.productId.productImage),
//             ),
//             title: Text(
//               productId.productId.productName,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 4),
//                 Text(
//                   productId.productId.productField,
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//                 const SizedBox(height: 8),
//                 // Text(
//                 //   'Experience: ${productId.productId.productExperience} years',
//                 //   style: TextStyle(color: Colors.grey[600]),
//                 // ),
//               ],
//             ),
//             trailing: const Icon(Icons.chevron_right),
//             onTap: () {
//               // Navigate to product details page
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }