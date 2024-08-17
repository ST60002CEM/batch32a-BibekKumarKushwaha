// Mocks generated by Mockito 5.4.4 from annotations
// in final_assignment/test/unit_testing/cart_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:final_assignment/core/failure/failure.dart' as _i6;
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart'
    as _i8;
import 'package:final_assignment/features/cart/domain/entity/cart_entity.dart'
    as _i7;
import 'package:final_assignment/features/cart/domain/repository/cart_repository.dart'
    as _i2;
import 'package:final_assignment/features/cart/domain/usecases/cart_usecase.dart'
    as _i4;
import 'package:final_assignment/features/cart/presentation/navigator/cart_navigator.dart'
    as _i9;
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

class _FakeICartRepository_0 extends _i1.SmartFake
    implements _i2.ICartRepository {
  _FakeICartRepository_0(
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

/// A class which mocks [CartUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartUsecase extends _i1.Mock implements _i4.CartUsecase {
  @override
  _i2.ICartRepository get cartRepository => (super.noSuchMethod(
        Invocation.getter(#cartRepository),
        returnValue: _FakeICartRepository_0(
          this,
          Invocation.getter(#cartRepository),
        ),
        returnValueForMissingStub: _FakeICartRepository_0(
          this,
          Invocation.getter(#cartRepository),
        ),
      ) as _i2.ICartRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.CartEntity>>> getCarts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCarts,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.CartEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.CartEntity>>(
          this,
          Invocation.method(
            #getCarts,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.CartEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.CartEntity>>(
          this,
          Invocation.method(
            #getCarts,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.CartEntity>>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> addCart(
    String? productId,
    int? quantity,
    int? total,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addCart,
          [
            productId,
            quantity,
            total,
          ],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addCart,
            [
              productId,
              quantity,
              total,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addCart,
            [
              productId,
              quantity,
              total,
            ],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> updateCart(
    String? productId,
    int? quantity,
    int? total,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCart,
          [
            productId,
            quantity,
            total,
          ],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #updateCart,
            [
              productId,
              quantity,
              total,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #updateCart,
            [
              productId,
              quantity,
              total,
            ],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> deleteCart(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteCart,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteCart,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteCart,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}

/// A class which mocks [UserSharedPrefs].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserSharedPrefs extends _i1.Mock implements _i8.UserSharedPrefs {
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> setUserToken(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #setUserToken,
          [token],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #setUserToken,
            [token],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #setUserToken,
            [token],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, String?>> getUserToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserToken,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String?>>.value(
            _FakeEither_1<_i6.Failure, String?>(
          this,
          Invocation.method(
            #getUserToken,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, String?>>.value(
                _FakeEither_1<_i6.Failure, String?>(
          this,
          Invocation.method(
            #getUserToken,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String?>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> removeUserToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #removeUserToken,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #removeUserToken,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #removeUserToken,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> saveFingerPrintId(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFingerPrintId,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #saveFingerPrintId,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #saveFingerPrintId,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);

  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> checkId() => (super.noSuchMethod(
        Invocation.method(
          #checkId,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #checkId,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, String>>.value(
                _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #checkId,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [CartViewNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartViewNavigator extends _i1.Mock implements _i9.CartViewNavigator {}