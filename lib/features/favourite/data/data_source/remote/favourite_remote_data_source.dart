// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:final_assignment/app/constants/api_endpoint.dart';
// import 'package:final_assignment/core/failure/failure.dart';
// import 'package:final_assignment/core/networking/remote/http_service.dart';
// import 'package:final_assignment/features/favourite/data/dto/favourite_dto.dart';

// import 'package:final_assignment/features/favourite/domain/entity/favourite_entity.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../../core/shared_prefs/user_shared_prefs.dart';

// final favouriteProductRemoteDataSourceProvider =
//     Provider<FavouriteProductRemoteDataSource>(
//   (ref) => FavouriteProductRemoteDataSource(
//     dio: ref.watch(httpServiceProvider),
//     userSharedPrefs: ref.watch(userSharedPrefsProvider),
//   ),
// );

// class FavouriteProductRemoteDataSource {
//   final Dio dio;
//   final UserSharedPrefs userSharedPrefs;

//   FavouriteProductRemoteDataSource(
//       {required this.dio, required this.userSharedPrefs});

//   Future<Either<Failure, List<FavouriteEntity>>> fetchFavouriteProducts() async {
//     try {
//       String? token;
//       final data = await userSharedPrefs.getUserToken();
//       data.fold(
//         (l) => token = null,
//         (r) => token = r,
//       );
//       Response response = await dio.get(ApiEndpoints.getUserFavorites,options: Options(
//         headers: {
//           'Authorization': 'Bearer $token'
//         }
//       ));
//       if (response.statusCode == 200) {
//         final favouriteProducts = FavouriteProductDto.fromJson(response.data).favorites;

//         return Right(favouriteProducts.map((e) => e.toEntity()).toList());
//       }
//       return Left(
//         Failure(
//           error: response.data['message'],
//           statusCode: response.statusCode.toString(),
//         ),
//       );
//     } on DioException catch (e) {
//       return Left(Failure(error: e.error.toString()));
//     }
//   }

// //   add doctor
//   Future<Either<Failure, bool>> addFavouriteProduct(String productId) async {
//     try {
//       String? token;
//       final data = await userSharedPrefs.getUserToken();
//       data.fold(
//         (l) => token = null,
//         (r) => token = r,
//       );
//       Response response = await dio.post(ApiEndpoints.addFavorite, data: {
//         'productId': productId
//       },options: Options(
//         headers: {
//           'Authorization': 'Bearer $token'
//         }
//       ));
//       if (response.statusCode == 201) {
//         return const Right(true);
//       }
//       return Left(
//         Failure(
//           error: response.data['message'],
//           statusCode: response.statusCode.toString(),
//         ),
//       );
//     } on DioException catch (e) {
//       return Left(Failure(error: e.error.toString()));
//     }
//   }

// //   remove 
//   Future<Either<Failure, bool>> removeFavouriteProduct(String productId) async {
//     try {
//       String? token;
//       final data = await userSharedPrefs.getUserToken();
//       data.fold(
//         (l) => token = null,
//         (r) => token = r,
//       );
//       Response response = await dio.delete(ApiEndpoints.deleteCart + productId
//       ,options: Options(
//         headers: {
//           'Authorization': 'Bearer $token'
//         }
//       ));
//       if (response.statusCode == 200) {
//         return const Right(true);
//       }
//       return Left(
//         Failure(
//           error: response.data['message'],
//           statusCode: response.statusCode.toString(),
//         ),
//       );
//     } on DioException catch (e) {
//       return Left(Failure(error: e.error.toString()));
//     }
//   }

// }
