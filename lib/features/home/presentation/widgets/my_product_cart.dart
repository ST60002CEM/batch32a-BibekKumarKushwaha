
// import 'package:final_assignment/app/constants/api_endpoint.dart';
// import 'package:final_assignment/features/home/domain/entity/product_entity.dart';

// import 'package:final_assignment/features/single_product/presentation/widgets/my_single_product_view.dart';
// import 'package:flutter/material.dart';

// class MyCard extends StatelessWidget {
//   final ProductEntity productEntity;
//   final VoidCallback onPressed;

//   const MyCard({super.key, required this.productEntity, required this.onPressed});
  

//   Widget build(BuildContext context) {
    
//     return SizedBox(

//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         elevation: 5, // Add elevation for shadow effect
//         shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
//                 child: GestureDetector(
//                   onTap: () {
//                     //Navigate to SingleView with the productEntity data
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SingleView(
//                           singleProduct: productEntity,
//                           selectedQuantity: 1, // Initialize with default quantity
//                           onAddToBag: onPressed,
//                           onIncreaseQuantity: () {},
//                           onDecreaseQuantity: () {},
//                         ),
//                       ),
//                     );
//                   },
//                   child: Stack(
//                     children: [
//                       Image.network(
//                         '${ApiEndpoints.imageUrl}${productEntity.productImage}',
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: 300.0,
//                         loadingBuilder: (context, child, loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                       loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         },
//                         errorBuilder: (context, error, stackTrace) =>
//                             const Center(
//                           child: Icon(Icons.error, color: Colors.red),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       productEntity.productName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Text(
//                     'Rs.${productEntity.productPrice}',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 productEntity.productCategory,
//                 style: const TextStyle(fontSize: 14),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.add_shopping_cart),
//                     color: Colors.blue,
//                     onPressed: onPressed,
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.reviews_outlined),
//                         color: Colors.green,
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.favorite_border_outlined),
//                         color: Colors.red,
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/favourite/presentation/viewmodel/fav_provider.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:final_assignment/features/single_product/presentation/widgets/my_single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCard extends ConsumerWidget {
  final ProductEntity productEntity;
  final VoidCallback onPressed;

  const MyCard({super.key, required this.productEntity, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteProductProvider).contains(productEntity);

    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5, // Add elevation for shadow effect
        shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                child: GestureDetector(
                  onTap: () {
                    //Navigate to SingleView with the productEntity data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleView(
                          singleProduct: productEntity,
                          selectedQuantity: 1, // Initialize with default quantity
                          onAddToBag: onPressed,
                          onIncreaseQuantity: () {},
                          onDecreaseQuantity: () {},
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        '${ApiEndpoints.imageUrl}${productEntity.productImage}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300.0,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              final notifier = ref.read(favoriteProductProvider.notifier);
                              if (isFavorite) {
                                notifier.removeProduct(productEntity);
                                showMySnackBar(
                                  message: "Product removed from favourites",
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                notifier.addProduct(productEntity);
                                showMySnackBar(
                                  message: "Product added to favourites",
                                  backgroundColor: Colors.green,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      productEntity.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Rs.${productEntity.productPrice}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                productEntity.productCategory,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    color: Colors.blue,
                    onPressed: onPressed,
                  ),
                  IconButton(
                    icon: const Icon(Icons.reviews_outlined),
                    color: Colors.green,
                    onPressed: () {},
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

