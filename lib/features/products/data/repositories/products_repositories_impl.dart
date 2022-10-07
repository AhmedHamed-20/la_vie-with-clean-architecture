import '../datasource/local_product_datasource.dart';
import '../../domain/usecases/delete_product_from_database.dart';
import '../../domain/usecases/get_all_products_from_database.dart';
import '../../domain/entities/products_database_entitie.dart';
import '../../domain/usecases/insert_product_into_database.dart';

import '../../../../core/error/exceptions.dart';
import '../datasource/get_all_products_remote_datasource.dart';
import '../../domain/entities/all_products_entitie.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/products_repositories.dart';
import '../../domain/usecases/get_all_products_usecase.dart';

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
      return Left(ServerFailure(failure.errorMessageModel.message));
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
      return Left(
          DatabaseFailure(failure.dataBaseErrorMessageModel.errorMessage));
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
          failure.dataBaseErrorMessageModel.errorMessage,
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
          failure.dataBaseErrorMessageModel.errorMessage,
        ),
      );
    }
  }
}
