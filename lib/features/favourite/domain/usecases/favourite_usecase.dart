// import 'package:dartz/dartz.dart';
// import 'package:final_assignment/core/failure/failure.dart';
// import 'package:final_assignment/features/favourite/data/repository/favourite_repository.dart';
// import 'package:final_assignment/features/favourite/domain/repository/i_favourite_repository.dart';
// import 'package:final_assignment/features/favouritedoctors/data/model/favourite_doctors_model.dart';
// import 'package:final_assignment/features/favouritedoctors/data/repository/favourite_doctor_repository.dart';
// import 'package:final_assignment/features/favouritedoctors/domain/entity/favourite_entity.dart';
// import 'package:final_assignment/features/favouritedoctors/domain/repository/i_favourite_doctors_repository.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final fetchFavouriteProductsUseCaseProvider = Provider<FavouriteProductsUseCase>((ref) {
//   return FavouriteProductsUseCase(ref.watch(favouriteProductRepositoryProvider));
// });

// class FavouriteProductsUseCase {
//   final IFavouriteProductRepository repository;

//   FavouriteProductsUseCase(this.repository);

//   Future<Either<Failure, List<FavouriteEntity>>> call() {
//     return repository.fetchFavouriteProducts();
//   }

//   Future<Either<Failure, bool>> addFavouriteProduct(String productId) {
//     return repository.addFavouriteProduct(productId);
//   }

//   Future<Either<Failure, bool>> removeFavouriteProduct(String productId) {
//     return repository.removeFavouriteProduct(productId);
//   }
// }
