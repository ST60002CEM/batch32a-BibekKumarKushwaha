
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:final_assignment/features/cart/domain/entity/cart_entity.dart';

class KhaltiPaymentView extends StatefulWidget {
  final List<CartEntity> cartItems;

  const KhaltiPaymentView({required this.cartItems, super.key});

  @override
  State<KhaltiPaymentView> createState() => _KhaltiPaymentViewState();
}

class _KhaltiPaymentViewState extends State<KhaltiPaymentView> {
  String referenceId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                payWithKhaltiInApp();
              },
              child: const Text("Pay with Khalti"),
            ),
            
            if (referenceId.isNotEmpty)
              Text(
                "Reference Id: $referenceId",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 1000, // in paisa
        productIdentity: 'buy now',
        productName: 'Chimney',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          actions: [
            SimpleDialogOption(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  referenceId = success.idx;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint('Cancelled');
  }

  void showCashOnDeliveryPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Successful'),
          content: SingleChildScrollView(
            child: Column(
              children: widget.cartItems.map((item) {
                return ListTile(
                  title: Text(item.productId!.productName),
                  subtitle: Text(
                      'Quantity: ${item.quantity}\nPrice: \$${item.productId!.productPrice * item.quantity}'),
                );
              }).toList(),
            ),
          ),
          actions: [
            SimpleDialogOption(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
