// import 'package:dartz/dartz.dart';
// import 'package:final_assignment/core/failure/failure.dart';
// import 'package:final_assignment/features/favourite/data/data_source/remote/favourite_remote_data_source.dart';
// import 'package:final_assignment/features/favouritedoctors/data/data_source/remote/favourite_doctor_remote_data_source.dart';
// import 'package:final_assignment/features/favouritedoctors/data/model/favourite_doctors_model.dart';
// import 'package:final_assignment/features/favourite/domain/entity/favourite_entity.dart';
// import 'package:final_assignment/features/favourite/domain/repository/i_favourite_repository.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final favouriteProductRepositoryProvider = Provider<IFavouriteProductRepository>((ref) {
//   return FavouriteProductRepository(ref.watch(favouriteProductRemoteDataSourceProvider));
// });

// class FavouriteProductRepository implements IFavouriteProductRepository {
//   final FavouriteProductRemoteDataSource remoteDataSource;

//   FavouriteProductRepository(this.remoteDataSource);

//   @override
//   Future<Either<Failure, List<FavouriteEntity>>> fetchFavouriteProducts() {
//     return remoteDataSource.fetchFavouriteProducts();
//   }

//   @override
//   Future<Either<Failure, bool>> addFavouriteProduct(String productId) {
//     return remoteDataSource.addFavouriteProduct(productId);
//   }

//   @override
//   Future<Either<Failure, bool>> removeFavouriteProduct(String productId) {
//     return remoteDataSource.removeFavouriteProduct(productId);
//   }


// }
