// import 'package:final_assignment/app/constants/api_endpoint.dart';
// import 'package:final_assignment/app/constants/colors.dart'; // Import TColors
// import 'package:final_assignment/app/constants/sizes.dart';
// import 'package:final_assignment/core/common/widgets/my_appbar.dart';
// import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
// import 'package:flutter/material.dart';



// class SingleView extends StatelessWidget {
//   final ProductEntity singleProduct;
//   final int selectedQuantity;
//   final VoidCallback onAddToBag;
//   final VoidCallback onIncreaseQuantity;
//   final VoidCallback onDecreaseQuantity;

//   const SingleView({
//     Key? key,
//     required this.singleProduct,
//     required this.selectedQuantity,
//     required this.onAddToBag,
//     required this.onIncreaseQuantity,
//     required this.onDecreaseQuantity,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final imageUrl = '${ApiEndpoints.imageUrl}${singleProduct.productImage}';
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom AppBar
//             AppBar(
//               title: const Text('Product Details'),
//             ),
//             // Main content
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Product Image
//                       AspectRatio(
//                         aspectRatio: 4 / 3,
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 16.0),
//                           decoration: BoxDecoration(
//                             color: isDarkMode
//                                 ? Colors.grey[800]
//                                 : Colors.grey[200],
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(
//                               imageUrl,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: TSizes.spaceBtwSections),
//                       // Thumbnail Images
//                       SizedBox(
//                         height: 100,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 4, // Number of thumbnails
//                           itemBuilder: (context, index) {
//                             return Container(
//                               margin:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.blue,
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.network(
//                                   imageUrl,
//                                   width: 80,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwSections),
//                       // Product Details
//                       Text(
//                         singleProduct.productName,
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineMedium
//                             ?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwItems),
//                       Text(
//                         singleProduct.productDescription,
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineMedium
//                             ?.copyWith(
//                               color: isDarkMode
//                                   ? Colors.grey[400]
//                                   : Colors.grey[600],
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwItems),
//                       Row(
//                         children: [
//                           const Icon(Icons.star, color: Colors.amber, size: 20),
//                           const SizedBox(width: 4),
//                           Text(
//                             '5.0',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium
//                                 ?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                           ),
//                           const SizedBox(width: 4),
//                           Text('(199 reviews)',
//                               style: Theme.of(context).textTheme.titleMedium),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         '\$${singleProduct.productPrice.toStringAsFixed(2)}',
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineSmall
//                             ?.copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).colorScheme.secondary,
//                             ),
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwSections),
//                       // Text(
//                       //   'Stock: ${singleProduct.productQuantity > 0 ? "In Stock" : "Out of Stock"}',
//                       //   style: TextStyle(
//                       //     color: singleProduct.productQuantity > 0
//                       //         ? Colors.green
//                       //         : Colors.red,
//                       //     fontWeight: FontWeight.bold,
//                       //   ),
//                       // ),

//                       const SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: isDarkMode
//                                   ? Colors.grey[800]
//                                   : Colors.grey[200],
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.remove),
//                                   onPressed: singleProduct.productPrice > 0
//                                       ? onDecreaseQuantity
//                                       : null,
//                                 ),
//                                 Text(
//                                   '$selectedQuantity',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.copyWith(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.add),
//                                   onPressed: singleProduct.productPrice > 0
//                                       ? onIncreaseQuantity
//                                       : null,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ElevatedButton.icon(
//                             onPressed: singleProduct.productPrice> 0
//                                 ? onAddToBag
//                                 : null,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: singleProduct.productPrice > 0
//                                   ? TColors.primary
//                                   : Colors.grey,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 12),
//                             ),
//                             icon: const Icon(Icons.shopping_bag_outlined,
//                                 color: Colors.white),
//                             label: const Text("Add to Cart",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:final_assignment/app/constants/api_endpoint.dart';
// import 'package:flutter/material.dart';
// import 'package:final_assignment/features/home/domain/entity/product_entity.dart';

// class SingleView extends StatelessWidget {
//   final ProductEntity singleProduct;
//   final int selectedQuantity;
//   final VoidCallback onAddToBag;
//   final VoidCallback onIncreaseQuantity;
//   final VoidCallback onDecreaseQuantity;

//   const SingleView({
//     Key? key,
//     required this.singleProduct,
//     required this.selectedQuantity,
//     required this.onAddToBag,
//     required this.onIncreaseQuantity,
//     required this.onDecreaseQuantity,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final imageUrl = '${ApiEndpoints.imageUrl}${singleProduct.productImage}';
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final primaryColor = Colors.blue.shade800;
//     final secondaryColor = Colors.blue.shade400;

//     return Scaffold(
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             AppBar(
//               title: const Text('Product Details'),
//               backgroundColor: primaryColor,
//               elevation: 0,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Product Image
//                       AspectRatio(
//                         aspectRatio: 4 / 3,
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 16.0),
//                           decoration: BoxDecoration(
//                             color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               color: primaryColor,
//                               width: 2,
//                             ),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(
//                               imageUrl,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Product Name
//                       Text(
//                         singleProduct.productName,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       // Price
//                       Text(
//                         'Rs.${singleProduct.productPrice.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       // Quantity Selector and Add to Cart
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color: primaryColor,
//                                 width: 1,
//                               ),
//                             ),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(2),
//                                   child: IconButton(
//                                     icon: const Icon(Icons.remove),
//                                     onPressed: singleProduct.productPrice > 0
//                                         ? onDecreaseQuantity
//                                         : null,
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                                   child: Text(
//                                     '$selectedQuantity',
//                                     style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.all(2),
//                                   child: IconButton(
//                                     icon: const Icon(Icons.add),
//                                     onPressed: singleProduct.productPrice > 0
//                                         ? onIncreaseQuantity
//                                         : null,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ElevatedButton.icon(
//                             onPressed: singleProduct.productPrice > 0
//                                 ? onAddToBag
//                                 : null,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: singleProduct.productPrice > 0
//                                   ? primaryColor
//                                   : Colors.grey,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 12),
//                             ),
//                             icon: const Icon(Icons.shopping_bag_outlined,
//                                 color: Colors.white),
//                             label: const Text(
//                               "Add to Cart",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       // Product Description Box
//                       Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(
//                             color: primaryColor,
//                             width: 1,
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Static Description
//                             const Text(
//                               'This is a high-quality product that meets all your needs and expectations. '
//                               'It is durable, reliable, and available at an affordable price.',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             // Product Description
//                             Text(
//                               singleProduct.productDescription,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: isDarkMode ? Colors.grey[400] : Colors.grey[800],
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             // Rating and Reviews
//                             const Row(
//                               children: [
//                                 Icon(Icons.star, color: Colors.amber, size: 20),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   '5.0',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   '(2 reviews)',
//                                   style: TextStyle(fontSize: 16, color: Colors.black87),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';

class SingleView extends StatelessWidget {
  final ProductEntity singleProduct;
  final int selectedQuantity;
  final VoidCallback onAddToBag;
  final VoidCallback onIncreaseQuantity;
  final VoidCallback onDecreaseQuantity;

  const SingleView({
    Key? key,
    required this.singleProduct,
    required this.selectedQuantity,
    required this.onAddToBag,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = '${ApiEndpoints.imageUrl}${singleProduct.productImage}';
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Colors.blue.shade800;
    final secondaryColor = Colors.blue.shade400;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: const Text('Product Details'),
              backgroundColor: primaryColor,
              elevation: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: primaryColor,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Product Name
                      Text(
                        singleProduct.productName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Price
                      Text(
                        'Rs.${singleProduct.productPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Quantity Selector and Add to Cart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: primaryColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  child: IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: singleProduct.productPrice > 0
                                        ? onDecreaseQuantity
                                        : null,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '$selectedQuantity',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: singleProduct.productPrice > 0
                                        ? onIncreaseQuantity
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: singleProduct.productPrice > 0
                                ? onAddToBag
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: singleProduct.productPrice > 0
                                  ? primaryColor
                                  : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            icon: const Icon(Icons.shopping_bag_outlined,
                                color: Colors.white),
                            label: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Product Description Box
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Description Points
                            Text(
                              '• High-quality material ensures durability and longevity.\n'
                              '• Stylish design that fits seamlessly with your home decor.\n'
                              '• Easy to use with intuitive controls and features.\n'
                              '• Affordable pricing without compromising on quality.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black, // Dark text for contrast
                              ),
                            ),
                            SizedBox(height: 16),
                            // Rating and Reviews
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                SizedBox(width: 4),
                                Text(
                                  '5.0',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Dark text for contrast
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '(2 reviews)',
                                  style: TextStyle(fontSize: 16, color: Colors.black), // Dark text for contrast
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
