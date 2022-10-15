import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/data/datasources/main_layout_local_datasource.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/data/datasources/main_layout_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/repositories/main_layout_repository.dart';

import '../../../../../error/exceptions.dart';
import '../../../../../error/failures.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/usecases/get_access_token_from_cache.dart';
import '../../domain/usecases/get_userdata_usecase.dart';

class MainLayoutRepositoryImpl extends MainLayoutRepository {
  final BaseMainLayoutRemoteDataSource baseMainLayoutRemoteDataSource;
  final BaseMainLayoutLocalDataSource baseMainLayoutLocalDataSource;
  MainLayoutRepositoryImpl(
      this.baseMainLayoutRemoteDataSource, this.baseMainLayoutLocalDataSource);
  @override
  Future<Either<Failure, UserDataEntitie>> getUserData(
      UserDataParams params) async {
    try {
      final result = await baseMainLayoutRemoteDataSource.getUserData(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.type));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getAccessTokenFromCache(
      AccessTokenFromCacheParams params) async {
    try {
      final result =
          await baseMainLayoutLocalDataSource.getAccessTokenFromCache(params);
      return Right(result);
    } on CacheException catch (failure) {
      return Left(
          CacheFailure(message: failure.localErrorsMessageModel.errorMessage));
    }
  }
}
