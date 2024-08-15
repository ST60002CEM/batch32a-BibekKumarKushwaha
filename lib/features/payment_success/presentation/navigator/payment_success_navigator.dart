import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/payment_success/presentation/view/payment_success_view.dart';

class PaymentSuccessViewNavigator {}

mixin PaymentSuccessViewRoute {
  void openPaymentSuccessView(String transactionId) {
    NavigateRoute.pushRoute(PaymentSuccessView(transactionId: transactionId));
  }
}
