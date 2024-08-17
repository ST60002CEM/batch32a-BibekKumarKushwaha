// import 'package:flutter/material.dart';

// class WishlistView extends StatelessWidget {
//   const WishlistView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wishlist'),
//       ),
//       body: ListView.builder(
//         itemCount: 10, // Replace with actual wishlist items count
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: const Icon(Icons.favorite), // Example icon, replace as needed
//             title: Text('Wishlist Item ${index + 1}'),
//             subtitle: const Text('Item description or details'),
//             trailing: IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () {
//                 // Implement delete functionality
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:final_assignment/app/constants/api_endpoint.dart';

import 'package:final_assignment/core/common/my_snackbar.dart';

import 'package:final_assignment/features/favourite/presentation/viewmodel/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
class FavouriteView extends ConsumerWidget {
  const FavouriteView({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProduct = ref.watch(favoriteProductProvider);
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Product'),
      ),
      body: ListView.builder(
        itemCount: favoriteProduct.length,
        itemBuilder: (context, index) {
          final product = favoriteProduct[index];
          return ListTile(
            leading: Image.network(
              '${ApiEndpoints.imageUrl}${product.productImage}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.productName),
            subtitle: Text(product.productCategory),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Rs ${product.productPrice}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref
                        .read(favoriteProductProvider.notifier)
                        .removeProduct(product);
                    showMySnackBar(message: 'Product removed from favorites', backgroundColor: Colors.red);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}