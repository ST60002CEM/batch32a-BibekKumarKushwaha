
// import 'package:final_assignment/core/common/my_snackbar.dart';
// import 'package:final_assignment/features/favourite/domain/usecases/favourite_usecase.dart';
// import 'package:final_assignment/features/favourite/presentation/state/favourite_state.dart';
// import 'package:final_assignment/features/favouritedoctors/domain/usecases/favourite_doctors_usecase.dart';
// import 'package:final_assignment/features/favouritedoctors/presentation/state/favourite_doctors_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final favouriteProductViewModelProvider =
//     StateNotifierProvider<FavouriteProductViewModel, FavouriteProductState>((ref) {
//   return FavouriteProductViewModel(ref.watch(fetchFavouriteProductsUseCaseProvider));
// });

// class FavouriteProductViewModel extends StateNotifier<FavouriteProductState> {
//   final FavouriteProductsUseCase fetchFavouriteProductsUseCase;

//   FavouriteProductViewModel(this.fetchFavouriteProductsUseCase) : super(FavouriteProductState.initial());

//   Future<void> fetchFavouriteProducts() async {
//     state = state.copyWith(isLoading: true);
//     final result = await fetchFavouriteProductsUseCase();
//     result.fold(
//       (failure) {
//         state = state.copyWith(isLoading: false, error: failure.error);
//       },
//       (favouriteProducts) {
//         state = state.copyWith(isLoading: false, favouriteProducts: favouriteProducts);
//       },
//     );
//   }

//    removeFavouriteProduct(String s) async {
//      final result = await fetchFavouriteProductsUseCase.removeFavouriteProduct(s);
//      result.fold(
//        (failure) {
//          showMySnackBar(message: failure.error, backgroundColor: Colors.red);
//        },
//        (data) {
//          fetchFavouriteProducts();
//          showMySnackBar(message: 'Removed from Favourites', backgroundColor: Colors.red);
//        },
//      );
//     fetchFavouriteProducts();
//    }
// }
