import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/cart/domain/entity/cart_entity.dart';

import 'package:final_assignment/features/home/data/model/product_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_api_model.g.dart';

//provider
final cartApiModelProvider =
    Provider<CartApiModel>((ref) => const CartApiModel.empty());

@JsonSerializable()
class CartApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? userId;
  final ProductApiModel? productId;
  final int quantity;
  final String status;
  final int total;


  const CartApiModel({
    this.id,
    this.userId,
    this.productId,
    required this.quantity,
    required this.status,
    required this.total,
  });

  const CartApiModel.empty()
      : id = '',
        userId = '',
        productId = null,
        quantity = 0,
        status = '',
        total = 0;

  factory CartApiModel.fromJson(Map<String, dynamic> json) =>
      _$CartApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartApiModelToJson(this);

  // To Entity
  CartEntity toEntity() {
    return CartEntity(
        id: id,
        userId: userId,
        productId: productId!.toEntity(),
        quantity: quantity,
        status: status,
        total: total); 
        
  }

  // Covert Entity to Api Object
  factory CartApiModel.fromEntity(CartEntity entity) {
    return CartApiModel(
        id: entity.id,
        userId: entity.userId,
        productId: ProductApiModel.fromEntity(entity.productId!),
        quantity: entity.quantity,
        status: entity.status,
        total: entity.total);
  }

  //Convert Api List to Entity List
  List<CartEntity> toEntityList(List<CartApiModel> carts) {
    return carts.map((cart) => cart.toEntity()).toList();
  }

  List<CartApiModel> fromEntityList(List<CartEntity> carts) {
    return carts.map((cart) => CartApiModel.fromEntity(cart)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        productId,
        quantity,
        status,
        total,
      ];
}
 