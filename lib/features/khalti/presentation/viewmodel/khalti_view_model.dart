
// import 'package:final_assignment/features/cart/domain/usecases/cart_usecase.dart';
// import 'package:final_assignment/features/khalti/domain/entity/khalti_entity.dart';
// import 'package:final_assignment/features/khalti/domain/usecases/khalti_usecase.dart';
// import 'package:final_assignment/features/khalti/presentation/navigator/khalti_navigator.dart';
// import 'package:final_assignment/features/khalti/presentation/state/khalti_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final khaltiViewModelProvider =
//     StateNotifierProvider<KhaltiViewModel, KhaltiState>((ref) {
//   return KhaltiViewModel(
//     khaltiUsecase: ref.watch(khaltiUsecaseProvider),
//     navigator: ref.watch(khaltiViewNavigatorProvider),
//     cartUsecase: ref.watch(cartUsecaseProvider),
//   );
// });

// class KhaltiViewModel extends StateNotifier<KhaltiState> {
//   KhaltiViewModel(
//       {required this.khaltiUsecase,
//       required this.navigator,
//       required this.cartUsecase})
//       : super(KhaltiState.initial());

//   final KhaltiUsecase khaltiUsecase;
//   final KhaltiViewNavigator navigator;
//   final CartUsecase cartUsecase;

//   verifyPayment(KhaltiEntity entity, String id) async {
//     state = state.copyWith(isLoading: true);
//     final result = await khaltiUsecase.completeKhalti(entity);
//     result.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
//         (r) {
//       state = state.copyWith(
//         isLoading: false,
//       );
//       changeStatus(
//         id,
//         r,
//       );
//     });
//   }

//   changeStatus(String cart, String transcationId) async {
//     state = state.copyWith(isLoading: true);

//     final result = await cartUsecase.cartRepository.changeStatus(cart);
//     result.fold(
//       (l) => state = state.copyWith(isLoading: false, error: l.error),
//       (r) {
//         state = state.copyWith(
//           isLoading: false,
//         );
//         openPaymentSuccessView(transcationId);
//       },
//     );
//   }

//   openPaymentSuccessView(String transactionId) {
//     navigator.openPaymentSuccessView(transactionId);
//   }
// }
