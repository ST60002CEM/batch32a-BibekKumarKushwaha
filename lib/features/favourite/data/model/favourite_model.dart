// // import 'package:equatable/equatable.dart';
// // import 'package:final_assignment/features/auth/data/model/auth_api_model.dart';

// // import 'package:final_assignment/features/home/data/model/product_model.dart';

// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:json_annotation/json_annotation.dart';

// // import '../../domain/entity/favourite_entity.dart';

// // part 'favourite_model.g.dart';

// // final favouriteProductApiModelProvider = Provider<FavouriteProduct>((ref) {
// //   return const FavouriteProduct.empty();
// // });

// // @JsonSerializable()
// // class FavouriteProduct extends Equatable {
// //   @JsonKey(name: '_id')
// //   final String id;
// //   final ProductApiModel productId;
// //   final AuthApiModel userId;

// //   const FavouriteProduct({

// //     required this.id,
// //     required this.productId,
// //     required this.userId,
// //   });

// //   // empty
// //    const FavouriteProduct.empty()
// //       : id = '',
// //         productId = const ProductApiModel.empty(),
// //         userId =  const AuthApiModel.empty();


// //   factory FavouriteProduct.fromJson(Map<String, dynamic> json) =>
// //       _$FavouriteProductFromJson(json);

// //   Map<String, dynamic> toJson() => _$FavouriteProductToJson(this);

// //   // to entity
// //   FavouriteEntity toEntity() {
// //     return FavouriteEntity(
// //       id: id,
// //       productId: productId.toEntity(),
// //       userId: userId.toEntity(),
// //     );
// //   }

// //   // from entity
// //   final factory FavouriteProduct.fromEntity(FavouriteEntity entity) {
// //     return FavouriteProduct(
// //       id: entity.id,
// //       productId: ProductApiModel.fromEntity(entity.productId),
// //       userId: AuthApiModel.fromEntity(entity.userId),
// //     );
// //   }

// //   // to entity list
// //   static List<FavouriteProduct> toEntityList(List<FavouriteEntity> favourites) {
// //     return favourites.map((favourite) => FavouriteProduct.fromEntity(favourite)).toList();
// //   }

// //   // from entity list
// //   static List<FavouriteEntity> fromEntityList(List<FavouriteProduct> favourites) {
// //     return favourites.map((favourite) => favourite.toEntity()).toList();
// //   }






// //   @override
// //   List<Object?> get props => [id, productId, userId];
// // }
// import 'package:equatable/equatable.dart';
// import 'package:final_assignment/features/auth/data/model/auth_api_model.dart';
// import 'package:final_assignment/features/home/data/model/product_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:json_annotation/json_annotation.dart';
// import '../../domain/entity/favourite_entity.dart';

// part 'favourite_model.g.dart';

// final favouriteProductApiModelProvider = Provider<FavouriteProduct>((ref) {
//   return const FavouriteProduct.empty();
// });

// @JsonSerializable()
// class FavouriteProduct extends Equatable {
//   @JsonKey(name: '_id')
//   final String id;
//   final ProductApiModel productId;
//   final AuthApiModel userId;

//   const FavouriteProduct({
//     required this.id,
//     required this.productId,
//     required this.userId,
//   });

//   // empty
//   const FavouriteProduct.empty()
//       : id = '',
//         productId = const ProductApiModel.empty(),
//         userId = const AuthApiModel.empty();

//   factory FavouriteProduct.fromJson(Map<String, dynamic> json) =>
//       _$FavouriteProductFromJson(json);

//   Map<String, dynamic> toJson() => _$FavouriteProductToJson(this);

//   // to entity
//   FavouriteEntity toEntity() {
//     return FavouriteEntity(
//       id: id,
//       productId: productId.toEntity(),
//       userId: userId.toEntity(),
//     );
//   }

//   // from entity
//   factory FavouriteProduct.fromEntity(FavouriteEntity entity) {
//     return FavouriteProduct(
//       id: entity.id,
//       productId: ProductApiModel.fromEntity(entity.productId),
//       userId: AuthApiModel.fromEntity(entity.userId),
//     );
//   }

//   // to entity list
//   static List<FavouriteProduct> toEntityList(List<FavouriteEntity> favourites) {
//     return favourites.map((favourite) => FavouriteProduct.fromEntity(favourite)).toList();
//   }

//   // from entity list
//   static List<FavouriteEntity> fromEntityList(List<FavouriteProduct> favourites) {
//     return favourites.map((favourite) => favourite.toEntity()).toList();
//   }

//   @override
//   List<Object?> get props => [id, productId, userId];
// }
