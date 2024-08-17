
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:final_assignment/features/payment/kpay_view.dart';
// import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
// import 'package:final_assignment/app/constants/api_endpoint.dart';

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
//       appBar: AppBar(
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
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 )
//               : ListView.builder(
//                   controller: _scrollController,
//                   itemCount: cartState.products.length,
//                   itemBuilder: (context, index) {
//                     final product = cartState.products[index];
//                     final imageUrl = '${ApiEndpoints.imageUrl}/${product.productId?.productImage}';

//                     return Card(
//                       margin: const EdgeInsets.all(10),
//                       child: ListTile(
//                         leading: product.productId?.productImage != null
//                             ? Image.network(
//                                 imageUrl,
//                                 width: 60,
//                                 height: 60,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) =>
//                                     const Icon(Icons.error, color: Colors.red),
//                               )
//                             : const Icon(Icons.error, color: Colors.red),
//                         title: Text(product.productId?.productName ?? 'No Name'),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Category: ${product.productId?.productCategory ?? 'Unknown'}'),
//                             Text('Quantity: ${product.quantity}'),
//                             Text('Price: \$${product.productId?.productPrice?.toStringAsFixed(2) ?? '0.00'}'),
//                           ],
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             ref
//                                 .read(cartViewModelProvider.notifier)
//                                 .deleteCart(product.id!);
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//       bottomNavigationBar: cartState.products.isEmpty
//           ? null
//           : Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Total:",
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "\$${cartState.products.fold(0, (sum, item) => sum + (item.productId!.productPrice! * item.quantity)).toStringAsFixed(2)}",
//                         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       final cartItems = cartState.products;
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => KhaltiPaymentView(cartItems: cartItems),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Proceed to Checkout",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
import 'package:final_assignment/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_assignment/features/payment/kpay_view.dart';
import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';

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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: cartState.products.length,
                  itemBuilder: (context, index) {
                    final product = cartState.products[index];
                    final imageUrl = '${ApiEndpoints.imageUrl}/${product.productId?.productImage}';

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: product.productId?.productImage != null
                            ? Image.network(
                                imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error, color: Colors.red),
                              )
                            : const Icon(Icons.error, color: Colors.red),
                        title: Text(product.productId?.productName ?? 'No Name'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category: ${product.productId?.productCategory ?? 'Unknown'}'),
                            Text('Quantity: ${product.quantity}'),
                            Text('Price: \$${product.productId?.productPrice?.toStringAsFixed(2) ?? '0.00'}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            ref
                                .read(cartViewModelProvider.notifier)
                                .deleteCart(product.id!);
                          },
                        ),
                      ),
                    );
                  },
                ),
      bottomNavigationBar: cartState.products.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${cartState.products.fold(0, (sum, item) => sum + (item.productId!.productPrice! * item.quantity)).toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      showPaymentOptions();
                    },
                    child: const Text(
                      "Proceed to Checkout",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void showPaymentOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KhaltiPaymentView(cartItems: ref.read(cartViewModelProvider).products),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Pay with Khalti'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  showCashOnDeliveryDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Cash on Delivery'),
              ),
            ],
          ),
        );
      },
    );
  }

  void showCashOnDeliveryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cash on Delivery'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure you want to select Cash on Delivery?'),
              const SizedBox(height: 10),
              ...ref.read(cartViewModelProvider).products.map((product) {
                return ListTile(
                  leading: Image.network(
                    '${ApiEndpoints.imageUrl}/${product.productId?.productImage}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.productId?.productName ?? 'No Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category: ${product.productId?.productCategory ?? 'Unknown'}'),
                      Text('Quantity: ${product.quantity}'),
                      Text('Price: \$${product.productId?.productPrice?.toStringAsFixed(2) ?? '0.00'}'),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                confirmOrder();
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void confirmOrder() async {
    // Remove cart items using existing logic
    await ref.read(cartViewModelProvider.notifier).clearCart();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Successful'),
          content: const Text('Thank you for your order!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the 'Order Successful' dialog
                 // Ensure we go back to CartView
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
