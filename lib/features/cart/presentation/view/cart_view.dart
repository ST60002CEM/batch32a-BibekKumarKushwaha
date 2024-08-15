// import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
// import 'package:final_assignment/features/cart/presentation/widgets/my_cart_widget.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CartView extends ConsumerStatefulWidget {
//   const CartView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
// }

// class _CartViewState extends ConsumerState<CartView> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       ref.read(cartViewModelProvider.notifier).getCarts();
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cartState = ref.watch(cartViewModelProvider);
//     final theme = Theme.of(context);
//     final isDarkMode = theme.brightness == Brightness.dark;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Cart",
//           style: TextStyle(
//             color: isDarkMode ? Colors.white : theme.primaryColorDark,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//           color: isDarkMode ? Colors.white : theme.primaryColorDark,
//         ),
//         backgroundColor: theme.appBarTheme.backgroundColor,
//         elevation: 0,
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: (scrollNotification) {
//           if (scrollNotification is ScrollEndNotification &&
//               _scrollController.position.extentAfter == 0) {
//             ref.read(cartViewModelProvider.notifier).getCarts();
//           }
//           return true;
//         },
//         child: RefreshIndicator(
//           onRefresh: () async {
//             await ref.read(cartViewModelProvider.notifier).getCarts();
//           },
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   physics: const AlwaysScrollableScrollPhysics(),
//                   controller: _scrollController,
//                   itemCount: cartState.products.length,
//                   itemBuilder: (context, index) {
//                     final cartItem = cartState.products[index];
//                     return CartItem(
//                       cartItem: cartItem,
//                       onDecreasePressed: () {
//                         ref.read(cartViewModelProvider.notifier).updateCart(
//                               cartItem.productId!,
//                               cartItem.quantity - 1,
//                               cartItem.total ,
//                             );
//                       },
//                       onIncreasePressed: () {
//                         ref.read(cartViewModelProvider.notifier).updateCart(
//                               cartItem.productId!,
//                               cartItem.quantity + 1,
//                               cartItem.total,
//                             );
//                       },
//                       onDeletePressed: () {
//                         ref
//                             .read(cartViewModelProvider.notifier)
//                             .deleteCart(cartItem.id!.toString());
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 color: theme.scaffoldBackgroundColor,
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: theme.primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     minimumSize: const Size(double.infinity, 50),
//                   ),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Checkout",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       // Text(
//                       //   cartState.t.toString(),
//                       //   style: const TextStyle(
//                       //     color: Colors.white,
//                       //     fontSize: 18,
//                       //     fontWeight: FontWeight.bold,
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
  
// }
// import 'package:final_assignment/core/common/widgets/my_appbar.dart';
// import 'package:final_assignment/features/cart/presentation/state/cart_state.dart';
// import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
 
// class CartView extends ConsumerStatefulWidget {
//   const CartView({super.key});
 
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
// }
 
// class _CartViewState extends ConsumerState<CartView> {
//   final ScrollController _scrollController = ScrollController();
 
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       ref.read(cartViewModelProvider.notifier).getCarts();
//     });
//   }
 
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     final cartState = ref.watch(cartViewModelProvider);
 
//     return Scaffold(
//       appBar:  AppBar(
//         title: const Text(
//           "Cart",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: cartState.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : cartState.products.isEmpty
//               ? const Center(
//                   child: Text(
//                     "Your cart is empty",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                   ),
//                 )
//               : Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         controller: _scrollController,
//                         itemCount: cartState.products.length,
//                         itemBuilder: (context, index) {
//                           final cartItem = cartState.products[index];
//                           return Card(
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 5),
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: ListTile(
//                               leading: Image.network(
//                                 cartItem.productId!.productImage,
//                                 fit: BoxFit.cover,
//                                 width: 30,
//                                 height: 30,
//                               ),
//                               title: Text(
//                                 cartItem.productId!.productName,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 "\$${(cartItem.productId!.productPrice * cartItem.quantity).toStringAsFixed(2)}",
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                               trailing: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.add_circle_outline),
//                                     onPressed: () {
//                                       ref
//                                           .read(cartViewModelProvider.notifier)
//                                           .updateCart(
//                                             cartItem.productId!,
//                                             cartItem.quantity + 1,
//                                             cartItem.total
//                                           );
//                                     },
//                                   ),
//                                   Text(
//                                     cartItem.quantity.toString(),
//                                     style: const TextStyle(fontSize: 16),
//                                   ),
//                                   IconButton(
//                                     icon:
//                                         const Icon(Icons.remove_circle_outline),
//                                     onPressed: () {
//                                       if (cartItem.quantity > 1) {
//                                         ref
//                                             .read(
//                                                 cartViewModelProvider.notifier)
//                                             .updateCart(
//                                               cartItem.productId!,
//                                               cartItem.quantity - 1,
//                                               cartItem.total 
//                                             );
//                                       } else {
//                                         ref
//                                             .read(
//                                                 cartViewModelProvider.notifier)
//                                             .deleteCart(cartItem.id!);
//                                       }
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     _buildCheckoutSection(cartState),
//                   ],
//                 ),
//     );
//   }
 
//   Widget _buildCheckoutSection(CartState cartState) {
//     final totalPrice = cartState.products.fold(
//       0,
//       (sum, item) => sum + (item.productId!.productPrice * item.quantity),
//     );
 
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: () {
//           // Add checkout logic here
//           print("Proceeding to checkout");
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           minimumSize: const Size(double.infinity, 50),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "Checkout",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "\$${totalPrice.toStringAsFixed(2)}",
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/common/widgets/my_appbar.dart';
import 'package:final_assignment/features/cart/presentation/state/cart_state.dart';
import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(cartViewModelProvider.notifier).getCarts();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cartState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : cartState.products.isEmpty
              ? const Center(
                  child: Text(
                    "Your cart is empty",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: cartState.products.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartState.products[index];
                          final imageUrl = '${ApiEndpoints.imageUrl}${cartItem.productId!.productImage}';

                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.error, color: Colors.red),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.productId!.productName,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "\$${cartItem.productId!.productPrice.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        ref
                                            .read(cartViewModelProvider.notifier)
                                            .updateCart(
                                              cartItem.productId!,
                                              cartItem.quantity + 1,
                                              cartItem.total,
                                            );
                                      },
                                    ),
                                    Text(
                                      cartItem.quantity.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    IconButton(
                                      icon:
                                          const Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        if (cartItem.quantity > 1) {
                                          ref
                                              .read(cartViewModelProvider.notifier)
                                              .updateCart(
                                                cartItem.productId!,
                                                cartItem.quantity - 1,
                                                cartItem.total,
                                              );
                                        } else {
                                          ref
                                              .read(cartViewModelProvider.notifier)
                                              .deleteCart(cartItem.id!);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    _buildCheckoutSection(cartState),
                  ],
                ),
    );
  }

  Widget _buildCheckoutSection(CartState cartState) {
    final totalPrice = cartState.products.fold(
      0,
      (sum, item) => sum + (item.productId!.productPrice * item.quantity),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          ref.read(cartViewModelProvider.notifier).openPaymenntView();
          // Add checkout logic here
          print("Proceeding to checkout");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Checkout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\$${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
