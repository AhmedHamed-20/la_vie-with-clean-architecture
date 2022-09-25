import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/data/datasource/get_all_products_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/get_all_products_entitie.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/repositories/get_all_products_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/usecases/get_all_products_usecase.dart';

class AllProductsRepositoriesImpl extends AllProductsRepositories {
  BaseAllProductsRemoteDataSource baseAllProductsRemoteDataSource;
  AllProductsRepositoriesImpl(this.baseAllProductsRemoteDataSource);

  @override
  Future<Either<Failure, List<AllProductsEntitie>>> getAllProducts(
      AllproudctsParams params) async {
    final result = await baseAllProductsRemoteDataSource.getAllProducts(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
