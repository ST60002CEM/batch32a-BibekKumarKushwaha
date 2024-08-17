import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 
class FavoriteProductNotifier extends StateNotifier<List<ProductEntity>> {
  FavoriteProductNotifier() : super([]);
 
  void addProduct(ProductEntity product) {
    state = [...state, product];
  }
 
  void removeProduct(ProductEntity product) {
    state = state.where((p) => p != product).toList();
  }
}
 
final favoriteProductProvider =
    StateNotifierProvider<FavoriteProductNotifier, List<ProductEntity>>(
        (ref) => FavoriteProductNotifier());