import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/cache_access_token.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/auth_entitie.dart';
import '../../../products/domain/entities/user_data.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../../products/domain/usecases/get_userdata_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signUp_usecase.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  BaseAuthLocalDataSource baseAuthLocalDataSource;
  AuthRepositoriesImpl(
      this.baseAuthRemoteDataSource, this.baseAuthLocalDataSource);
  @override
  Future<Either<Failure, AuthDataEntitie>> login(LoginParams params) async {
    try {
      final result = await baseAuthRemoteDataSource.login(params);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AuthDataEntitie>> signUp(SignUpParams params) async {
    try {
      final result = await baseAuthRemoteDataSource.signUp(params);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> cacheAccessToken(
      AccessTokenCacheParams params) async {
    try {
      final result = await baseAuthLocalDataSource.cacheAccessToken(params);
      return Right(result);
    } on CacheException catch (failure) {
      return Left(CacheFailure(failure.localErrorsMessageModel.errorMessage));
    }
  }
}
