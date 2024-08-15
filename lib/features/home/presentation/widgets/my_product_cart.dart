
// import 'package:final_assignment/app/constants/api_endpoint.dart';
// import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
// import 'package:flutter/material.dart';
 
// class MyCard extends StatelessWidget {
//   final ProductEntity productEntity;
//   final VoidCallback onPressed;
 
//   const MyCard({super.key, required this.productEntity, required this.onPressed});
 
//   @override
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
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(20.0)),
//                 child: Stack(
//                   children: [
//                     Image.network(
//                       '${ApiEndpoints.imageUrl}${productEntity.productImage}',
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: 300.0,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                     loadingProgress.expectedTotalBytes!
//                                 : null,
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) =>
//                           const Center(
//                         child: Icon(Icons.error, color: Colors.red),
//                       ),
//                     ),
//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(255, 124, 87, 235)
//                                   .withOpacity(0.6),
//                               Color.fromARGB(178, 35, 1, 121),
//                             ],
//                             begin: Alignment.bottomRight,
//                             end: Alignment.topLeft,
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Rs.${productEntity.productPrice}',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 productEntity.productName,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
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
//                     color: Colors.green,
//                     onPressed: onPressed,
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.share),
//                         color: Colors.blue,
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
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final ProductEntity productEntity;
  final VoidCallback onPressed;

  const MyCard({super.key, required this.productEntity, required this.onPressed});

  @override
  Widget build(BuildContext context) {
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
                  ],
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
                    color: Colors.green,
                    onPressed: onPressed,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border_outlined),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ],
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
