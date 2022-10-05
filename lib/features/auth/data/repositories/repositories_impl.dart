import '../../../../core/error/exceptions.dart';
import '../datasources/auth_remote_datasource.dart';
import '../../domain/entities/auth_entitie.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../domain/usecases/get_userdata_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signUp_usecase.dart';

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
