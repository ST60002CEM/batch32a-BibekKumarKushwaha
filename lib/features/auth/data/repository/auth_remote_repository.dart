import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDatasourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return _authRemoteDataSource.loginUser(
        email: email, password: password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return _authRemoteDataSource.createUser(user);
  }

  @override
  Future<Either<Failure, bool>> verifyUser() {
    return _authRemoteDataSource.verifyUser();
  }
 
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    return _authRemoteDataSource.getMe();
  }
 
  @override
  Future<Either<Failure, bool>> fingerPrintLogin(String id) {
    return _authRemoteDataSource.fingerPrintLogin(id);
  }
}
