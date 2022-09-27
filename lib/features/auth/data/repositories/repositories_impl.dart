import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/auth_entitie.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/user_data.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/repositories/auth_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/get_userdata_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/signUp_usecase.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  AuthRepositoriesImpl(this.baseAuthRemoteDataSource);
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
  Future<Either<Failure, UserDataEntitie>> getUserData(
      UserDataParams params) async {
    try {
      final result = await baseAuthRemoteDataSource.getUserData(params);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
