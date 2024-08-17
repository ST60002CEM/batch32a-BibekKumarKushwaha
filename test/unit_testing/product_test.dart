import 'package:dartz/dartz.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:final_assignment/features/home/domain/usecases/product_usecase.dart';

import 'package:final_assignment/features/home/presentation/viewmodel/products_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductUsecase>()])
void main() {
  late ProductUsecase mockProductUsecase;
  late ProviderContainer container;

  setUp(() {
    mockProductUsecase = MockProductUsecase();
    container = ProviderContainer(
      overrides: [
        productViewModelProvider.overrideWith(
          (ref) => ProductViewmodel(productUsecase: mockProductUsecase),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('getProducts should correctly handle new data', () async {
    when(mockProductUsecase.pagination(any, any))
        .thenAnswer((_) async => const Right([
              ProductEntity(
                id: '1',
                productName: 'Product 1',
                productPrice: 1000,
                productImage: 'image1.jpg',
                productDescription: 'Description 1',
                productCategory: 'Category 1',
              ),
              ProductEntity(
                id: '2',
                productName: 'Product 2',
                productPrice: 2000,
                productImage: 'image2.jpg',
                productDescription: 'Description 2',
                productCategory: 'Category 2',
              ),
            ]));

    final viewModel = container.read(productViewModelProvider.notifier);
    await viewModel.getProducts();

    // Assertions to verify state changes
    final state = container.read(productViewModelProvider);
    expect(state.isLoading, false);
    expect(state.products.isNotEmpty, true);
    expect(state.products.length, 2);
    expect(state.page, equals(1)); // Assuming initial page is 1
  });

  test('getProducts should handle empty data by setting hasReachedMax to true', () async {
    when(mockProductUsecase.pagination(any, any))
        .thenAnswer((_) async => const Right([]));

    final viewModel = container.read(productViewModelProvider.notifier);
    await viewModel.getProducts();

    // Assertions to verify handling of empty data
    final state = container.read(productViewModelProvider);
    expect(state.hasReachedMax, true);
    expect(state.isLoading, false);
    expect(state.products.isEmpty, true);
  });

  test('resetState should correctly reset the state and fetch initial data', () async {
    when(mockProductUsecase.pagination(any, any)).thenAnswer(
      (_) async => const Right([
        ProductEntity(
          id: '1',
          productName: 'Product 1',
          productPrice: 1000,
          productImage: 'image1.jpg',
          productDescription: 'Description 1',
          productCategory: 'Category 1',
        ),
      ]),
    );

    final viewModel = container.read(productViewModelProvider.notifier);

    // Simulate state change before reset
    await viewModel.getProducts();

    // Reset the state
    await viewModel.resetState();

    // Assertions to verify state reset and fetching initial data
    final state = container.read(productViewModelProvider);
    expect(state.isLoading, isFalse);
    expect(state.products.isNotEmpty, isTrue);
    expect(state.products.length, 1);
    expect(state.page, equals(1)); // State should be reset to initial page
  });

 
}
