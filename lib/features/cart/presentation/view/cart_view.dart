import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:final_assignment/features/cart/presentation/widgets/my_cart_widget.dart';

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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            color: isDarkMode ? Colors.white : theme.primaryColorDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: isDarkMode ? Colors.white : theme.primaryColorDark,
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification &&
              _scrollController.position.extentAfter == 0) {
            ref.read(cartViewModelProvider.notifier).getCarts();
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(cartViewModelProvider.notifier).getCarts();
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: cartState.products.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartState.products[index];
                    return CartItem(
                      cartItem: cartItem,
                      onDecreasePressed: () {
                        ref.read(cartViewModelProvider.notifier).updateCart(
                              cartItem.productId!,
                              cartItem.quantity - 1,
                              cartItem.total ,
                            );
                      },
                      onIncreasePressed: () {
                        ref.read(cartViewModelProvider.notifier).updateCart(
                              cartItem.productId!,
                              cartItem.quantity + 1,
                              cartItem.total,
                            );
                      },
                      onDeletePressed: () {
                        ref
                            .read(cartViewModelProvider.notifier)
                            .deleteCart(cartItem.id!.toString());
                      },
                    );
                  },
                ),
              ),
              Container(
                color: theme.scaffoldBackgroundColor,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   cartState.t.toString(),
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
