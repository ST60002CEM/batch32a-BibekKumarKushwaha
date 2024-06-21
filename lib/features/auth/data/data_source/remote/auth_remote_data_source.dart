import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/auth/data/model/auth_api_model.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>(
  (ref) => AuthRemoteDatasource(
    dio: ref.watch(httpServiceProvider),
    authApiModel: ref.watch(authApiModelProvider),
    userSharedprefs: ref.watch(userSharedPrefsProvider),
  ),
);

class AuthRemoteDatasource {
  final Dio dio;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedprefs;

  AuthRemoteDatasource({
    required this.dio,
    required this.authApiModel,
    required this.userSharedprefs,
  });

  Future<Either<Failure, bool>> createUser(AuthEntity authEntity) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.register,
        data: authApiModel.fromEntity(authEntity).toJson(),
      );
      if (response.statusCode == 201) {
        return const Right(true);
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginUser(
      {required String email, required String password}) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 201) {
        return const Right(true);
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }
}
