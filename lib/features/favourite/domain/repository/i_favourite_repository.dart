import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';

import 'package:final_assignment/features/favourite/domain/entity/favourite_entity.dart';


abstract class IFavouriteProductRepository {
  Future<Either<Failure, List<FavouriteEntity>>> fetchFavouriteProducts();

  Future<Either<Failure, bool>> addFavouriteProduct(String productId);

  Future<Either<Failure, bool>> removeFavouriteProduct(String productId);
}
