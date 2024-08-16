import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/cart/domain/entity/cart_entity.dart';
import 'package:final_assignment/features/cart/domain/usecases/cart_usecase.dart';
import 'package:final_assignment/features/cart/presentation/navigator/cart_navigator.dart';
import 'package:final_assignment/features/cart/presentation/view_model/cart_view_model.dart';

import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CartUsecase>(),
  MockSpec<UserSharedPrefs>(),
  MockSpec<CartViewNavigator>(),
])
void main() {
  late MockCartUsecase mockCartUsecase;
  late MockUserSharedPrefs mockUserSharedPrefs;
  late MockCartViewNavigator mockCartViewNavigator;
  late ProviderContainer container;

  setUp(() {
    mockCartUsecase = MockCartUsecase();
    mockUserSharedPrefs = MockUserSharedPrefs();
    mockCartViewNavigator = MockCartViewNavigator();

    container = ProviderContainer(
      overrides: [
        cartViewModelProvider.overrideWith(
          (ref) => CartViewModel(
            cartUsecase: mockCartUsecase,
            userSharedPrefs: mockUserSharedPrefs,
            cartViewNavigator: mockCartViewNavigator,
          ),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CartViewModel Tests', () {
    test('getCarts should fetch cart items and update state correctly', () async {
      const mockProduct = ProductEntity(
        id: '1',
        productName: 'Product 1',
        productPrice: 100,
        productImage: 'image1.jpg',
        productDescription: 'Description',
        productCategory: 'Category',
      );

      final mockCartItems = [
        const CartEntity(
          id: '1',
          userId: 'user1',
          productId: mockProduct,
          quantity: 2,
          status: 'in_cart',
          total: 200,
        ),
      ];

      when(mockCartUsecase.getCarts()).thenAnswer(
        (_) async => Right(mockCartItems),
      );

      final viewModel = container.read(cartViewModelProvider.notifier);
      await viewModel.getCarts();

      final state = container.read(cartViewModelProvider);
      expect(state.isLoading, false);
      expect(state.products.isNotEmpty, true);
      expect(state.products.length, 1);
    });
    test('openPaymentView should call the navigator method', () {
      final viewModel = container.read(cartViewModelProvider.notifier);
      viewModel.openPaymenntView();

      verify(mockCartViewNavigator.openKhaltiView()).called(1);
    });
  });
}
