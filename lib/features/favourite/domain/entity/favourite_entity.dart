
import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';

class FavouriteEntity extends Equatable {
  final String id;
  final ProductEntity productId;
  final AuthEntity userId;

  FavouriteEntity({required this.id, required this.productId, required this.userId,});

  @override
  List<Object?> get props => [id, productId, userId];

}