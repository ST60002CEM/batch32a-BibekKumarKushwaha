import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';


class CartEntity extends Equatable {
  final String? id;
  final String? userId;
  final ProductEntity? productId;
  final int quantity;
  final String status;
  final int total;

  const CartEntity({
    this.id,
    this.userId,
    this.productId,
    required this.quantity,
    required this.status,
    required this.total,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        productId,
        quantity,
        status,
      ];
}
