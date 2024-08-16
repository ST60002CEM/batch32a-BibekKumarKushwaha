// Mocks generated by Mockito 5.4.4 from annotations
// in final_assignment/test/unit_testing/single_product_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:final_assignment/core/failure/failure.dart' as _i6;
import 'package:final_assignment/features/home/domain/entity/product_entity.dart'
    as _i7;
import 'package:final_assignment/features/home/domain/repository/product_repository.dart'
    as _i2;
import 'package:final_assignment/features/home/domain/usecases/product_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIProductRepository_0 extends _i1.SmartFake
    implements _i2.IProductRepository {
  _FakeIProductRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductUsecase extends _i1.Mock implements _i4.ProductUsecase {
  @override
  _i2.IProductRepository get productRepository => (super.noSuchMethod(
        Invocation.getter(#productRepository),
        returnValue: _FakeIProductRepository_0(
          this,
          Invocation.getter(#productRepository),
        ),
        returnValueForMissingStub: _FakeIProductRepository_0(
          this,
          Invocation.getter(#productRepository),
        ),
      ) as _i2.IProductRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>> pagination(
    int? page,
    int? limit,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #pagination,
          [
            page,
            limit,
          ],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.ProductEntity>>(
          this,
          Invocation.method(
            #pagination,
            [
              page,
              limit,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.ProductEntity>>(
          this,
          Invocation.method(
            #pagination,
            [
              page,
              limit,
            ],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.ProductEntity>>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.ProductEntity>> getProductById(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductById,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i7.ProductEntity>>.value(
                _FakeEither_1<_i6.Failure, _i7.ProductEntity>(
          this,
          Invocation.method(
            #getProductById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i7.ProductEntity>>.value(
                _FakeEither_1<_i6.Failure, _i7.ProductEntity>(
          this,
          Invocation.method(
            #getProductById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.ProductEntity>>);
}
