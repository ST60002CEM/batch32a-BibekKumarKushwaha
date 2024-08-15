
import 'package:final_assignment/features/cart/domain/usecases/cart_usecase.dart';
import 'package:final_assignment/features/cart/presentation/navigator/cart_navigator.dart';
import 'package:final_assignment/features/cart/presentation/state/cart_state.dart';

import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';

import 'package:final_assignment/features/home/domain/entity/product_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/my_snackbar.dart';

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, CartState>((ref) => CartViewModel(
          
          cartUsecase: ref.watch(cartUsecaseProvider),
          userSharedPrefs: ref.watch(userSharedPrefsProvider), cartViewNavigator: ref.watch(cartNavigatorProvider),
        ));

class CartViewModel extends StateNotifier<CartState> {
  CartViewModel({
    required this.cartUsecase,
    required this.userSharedPrefs,
    required this.cartViewNavigator,

  }) : super(CartState.initial());

  final CartUsecase cartUsecase;
  final UserSharedPrefs userSharedPrefs;
  final CartViewNavigator cartViewNavigator;

  

  //get cart
  Future<void> getCarts() async {
    state = state.copyWith(isLoading: true);
    final result = await cartUsecase.getCarts();
    var data = await cartUsecase.getCarts();

    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showMySnackBar(message: failure.error, backgroundColor: Colors.red);
    }, (success) {
      state = state.copyWith(isLoading: false, error: null, products: success);
      //showMySnackBar(message: 'Cart fetched successfully', backgroundColor: Colors.green);
    });
  }

  //add cart
  Future<void> addCart(String productId, int quantity, int total) async {
    state = state.copyWith(isLoading: true);
    final result = await cartUsecase.addCart(productId, quantity, total);

    result.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showMySnackBar(message: failure.error, backgroundColor: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      showMySnackBar(message: 'Product added to cart', backgroundColor: Colors.green);
    });
    getCarts();
  }

  //update cart
  Future<void> updateCart(ProductEntity productId, int quantity, int total) async {
    state = state.copyWith(isLoading: true);
    final result = await cartUsecase.updateCart(productId.id!, quantity, total);
    result.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showMySnackBar(message: failure.error, backgroundColor: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      showMySnackBar(message: 'Cart updated successfully', backgroundColor: Colors.green);
    });
    await getCarts();
  }

  //delete cart
  Future<void> deleteCart(String productId) async {
    state = state.copyWith(isLoading: true);
    final result = await cartUsecase.deleteCart(productId);
    result.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showMySnackBar(message: failure.error, backgroundColor: Colors.red);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      showMySnackBar(message: 'Product removed from cart', backgroundColor: Colors.green);
    });
    await getCarts();
  }
  void openPaymenntView() {
      cartViewNavigator.openKhaltiView();
  }
}
