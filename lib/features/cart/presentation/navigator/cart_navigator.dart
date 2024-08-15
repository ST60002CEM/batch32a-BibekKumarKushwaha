import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/cart/presentation/view/cart_view.dart';
import 'package:final_assignment/features/payment/navigator/kpay_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final cartNavigatorProvider = Provider<CartViewNavigator>((ref) {
  return CartViewNavigator();
});

class CartViewNavigator with KpayRoute{}
mixin CartViewRoute{
  void navigateToCartView(){
    NavigateRoute.pushRoute(const CartView());
  }
}