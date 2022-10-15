import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/clear_cache.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/clear_user_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/update_amount_database.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/all_products_entitie.dart';
import '../../domain/entities/products_database_entitie.dart';
import '../../domain/repositories/products_repositories.dart';
import '../../domain/usecases/delete_product_from_database.dart';
import '../../domain/usecases/get_all_products_from_database.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../../domain/usecases/insert_product_into_database.dart';
import '../datasource/get_all_products_remote_datasource.dart';
import '../datasource/local_product_datasource.dart';

class AllProductsRepositoriesImpl extends AllProductsRepositories {
  BaseAllProductsRemoteDataSource baseAllProductsRemoteDataSource;
  BaseAllProductsLocalDataSource baseAllProductsLocalDataSource;
  AllProductsRepositoriesImpl(this.baseAllProductsRemoteDataSource,
      this.baseAllProductsLocalDataSource);

  @override
  Future<Either<Failure, List<AllProductsEntitie>>> getAllProducts(
      AllproudctsParams params) async {
    try {
      final result =
          await baseAllProductsRemoteDataSource.getAllProducts(params);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.type));
    }
  }

  @override
  Future<Either<Failure, void>> insertProductIntoDatabase(
      DatabaseProductParams params) async {
    try {
      final result = await baseAllProductsLocalDataSource
          .insertProductIntoDatabase(params);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(DatabaseFailure(
          message: failure.dataBaseErrorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductsDatabaseEntitie>>>
      getProductsFromDatabase(ProductsFromDatabaseParams params) async {
    try {
      final result =
          await baseAllProductsLocalDataSource.getProductsFromDatabase(params);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(
        DatabaseFailure(
          message: failure.dataBaseErrorMessageModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> deleteProductFromDatabase(
      ProductDeletionFromDatabaseParams params) async {
    try {
      final result = await baseAllProductsLocalDataSource
          .deleteProductFromDatabaseById(params);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(
        DatabaseFailure(
          message: failure.dataBaseErrorMessageModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> clearUserCache(CacheClearParams params) async {
    try {
      final result =
          await baseAllProductsLocalDataSource.clearUserCache(params);
      return Right(result);
    } on CacheException catch (failure) {
      return Left(
          CacheFailure(message: failure.localErrorsMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> clearUserCartDataBase(
      UserCartDataBaseClearParams params) async {
    try {
      final result =
          await baseAllProductsLocalDataSource.clearUserCartDataBase(params);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(DatabaseFailure(
          message: failure.dataBaseErrorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, int>> updateAmountInCartDatabase(
      AmountUpdateInDataBaseParams params) async {
    try {
      final result =
          await baseAllProductsLocalDataSource.updateAmountCartDatabase(params);
      return Right(result);
    } on AppDataBaseException catch (failure) {
      return Left(DatabaseFailure(
          message: failure.dataBaseErrorMessageModel.errorMessage));
    }
  }
}
