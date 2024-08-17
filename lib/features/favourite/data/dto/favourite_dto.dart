
// class FavouriteProduct {
//   final bool success;
//   final List<FavouriteProduct> favorites;

//   FavouriteProductDto({required this.success, required this.favorites});

// //   from json
//   factory FavouriteProductDto.fromJson(Map<String, dynamic> json) {
//     return FavouriteProductDto(
//       success: json['success'],
//       favorites: (json['favorites'] as List)
//           .map((product) => FavouriteProduct.fromJson(product))
//           .toList(),
//     );
//   }

// //   to json
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'favorites': favorites.map((product) => product.toJson()).toList(),
//     };
//   }


// }