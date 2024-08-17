// import 'package:final_assignment/features/cart/data/model/cart_api_model.dart';

// import 'package:json_annotation/json_annotation.dart';

// part 'cart_dto.g.dart';

// @JsonSerializable()
// class CartDto {
//   final bool? success;
//   final String message;
//   final List<CartApiModel> carts;

//   CartDto({
//     required this.success,
//     required this.message,
//     required this.carts,
//   });

//   factory CartDto.fromJson(Map<String, dynamic> json) =>
//       _$CartDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$CartDtoToJson(this);
// }
import 'package:json_annotation/json_annotation.dart';
import 'package:final_assignment/features/cart/data/model/cart_api_model.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  final bool? success;
  final String? message; // Change to nullable
  final List<CartApiModel> carts;

  CartDto({
    this.success, // Nullable field
    this.message, // Nullable field
    required this.carts,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) => _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);
}
