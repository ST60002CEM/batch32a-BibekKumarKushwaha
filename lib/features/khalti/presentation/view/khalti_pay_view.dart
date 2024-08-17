// import 'dart:developer';

// import 'package:final_assignment/features/cart/domain/entity/cart_entity.dart';
// import 'package:final_assignment/features/khalti/domain/entity/khalti_entity.dart';
// import 'package:final_assignment/features/khalti/presentation/viewmodel/khalti_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

// class KhaltiSDKDemo extends ConsumerStatefulWidget {
//   const KhaltiSDKDemo({
//     super.key,
//     required this.pidx,
//     required this.entity,
//   });

//   final String pidx;
//   final CartEntity entity;
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _KhaltiSDKDemoState();
// }

// class _KhaltiSDKDemoState extends ConsumerState<KhaltiSDKDemo> {
//   late final Future<Khalti?> khalti;

//   PaymentResult? paymentResult;
//   CartEntity? cartEntity;

//   @override
//   void initState() {
//     super.initState();
//     CartEntity = widget.entity;
//     final payConfig = KhaltiPayConfig(
//       publicKey: '96b8e06cfe8c4ea0a27e2a224e149c5b',
//       pidx: widget.pidx,
//       environment: Environment.test,
//     );

//     khalti = Khalti.init(
//       enableDebugging: true,
//       payConfig: payConfig,
//       onPaymentResult: (paymentResult, khalti) {
//         log(paymentResult.toString());
//         KhaltiEntity khaltiEntity = KhaltiEntity(
//           pidx: paymentResult.payload!.pidx ?? '',
//           transactionId: paymentResult.payload!.transactionId ?? '',
//           productId: paymentResult.payload!.purchaseOrderId ?? '',
//           amount: paymentResult.payload!.totalAmount.toDouble(),
//         );

//         ref
//             .read(khaltiViewModelProvider.notifier)
//             .verifyPayment(khaltiEntity, CartEntity?.id ?? '');

//         khalti.close(context);
//       },
//       onMessage: (
//         khalti, {
//         description,
//         statusCode,
//         event,
//         needsPaymentConfirmation,
//       }) async {
//         log(
//           'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
//         );
//         log('confiramtiona=== $needsPaymentConfirmation');
//         khalti.close(context);
//       },
//       onReturn: () => log('Successfully redirected to return_url.'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: khalti,
//           initialData: null,
//           builder: (context, snapshot) {
//             final khaltiSnapshot = snapshot.data;
//             if (khaltiSnapshot == null) {
//               return const CircularProgressIndicator.adaptive();
//             }
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/clpic.png',
//                   height: 200,
//                   width: 200,
//                 ),
//                 const SizedBox(height: 120),
//                 Text(
//                   '${cartEntity!.show.userId.productId} on ${cartEntity!.show.showDate.toString().substring(0, 10)}',
//                   style: const TextStyle(fontSize: 25),
//                 ),
//                 Text("Rs.${cartEntity!.price}"),
//                 OutlinedButton(
//                   onPressed: () => khaltiSnapshot.open(context),
//                   child: const Text('Pay with Khalti'),
//                 ),
//                 const SizedBox(height: 120),
//                 paymentResult == null
//                     ? Text(
//                         'pidx: ${widget.pidx}',
//                         style: const TextStyle(fontSize: 15),
//                       )
//                     : Column(
//                         children: [
//                           Text(
//                             'pidx: ${paymentResult!.payload?.pidx}',
//                           ),
//                           Text('Status: ${paymentResult!.payload?.status}'),
//                           Text(
//                             'Amount Paid: ${paymentResult!.payload?.totalAmount}',
//                           ),
//                           Text(
//                             'Transaction ID: ${paymentResult!.payload?.transactionId}',
//                           ),
//                         ],
//                       ),
//                 const SizedBox(height: 120),
//                 const Text(
//                   'Make a payment to purchase ticket',
//                   style: TextStyle(fontSize: 12),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
