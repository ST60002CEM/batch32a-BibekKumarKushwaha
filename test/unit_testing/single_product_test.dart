import 'package:dartz/dartz.dart';

import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:final_assignment/features/home/domain/usecases/product_usecase.dart';

import 'package:final_assignment/features/single_product/presentation/view_model/single_product_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'single_product_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductUsecase>()])
void main() {
  late ProductUsecase mockProductUsecase;
  late ProviderContainer container;

  setUp(() {
    mockProductUsecase = MockProductUsecase();
    container = ProviderContainer(
      overrides: [
        singleProductViewModelProvider.overrideWith(
          (ref) => SingleProductViewModel(
            productUsecase: mockProductUsecase,
            userSharedPrefs: ref.watch(userSharedPrefsProvider),
          ),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('getSingleProduct should correctly fetch and update state', () async {
    final productId = '1';
    const product = ProductEntity(
      id: '1',
      productName: 'Product 1',
      productPrice: 1000,
      productImage: 'image1.jpg',
      productDescription: 'Description 1',
      productCategory: 'Category 1',
    );

    when(mockProductUsecase.getProductById(productId))
        .thenAnswer((_) async => const Right(product));

    final viewModel = container.read(singleProductViewModelProvider.notifier);
    await viewModel.getSingleProduct(productId);

    // Assertions to verify state changes
    final state = container.read(singleProductViewModelProvider);
    expect(state.isLoading, false);
    expect(state.singleProduct, isNotNull);
    expect(state.singleProduct!.id, product.id);
    expect(state.error, isNull);
  });

  

  test('updateSelectedQuantity should update the selected quantity', () {
    final viewModel = container.read(singleProductViewModelProvider.notifier);

    // Update selected quantity to a valid value
    viewModel.updateSelectedQuantity(3);

    // Assertions to verify state changes
    final state = container.read(singleProductViewModelProvider);
    expect(state.selectedQuantity, 3);
  });
  
  

  
}
