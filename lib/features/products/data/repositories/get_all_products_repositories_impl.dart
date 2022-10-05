import '../../../../core/error/exceptions.dart';
import '../datasource/get_all_products_remote_datasource.dart';
import '../../domain/entities/all_products_entitie.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../blogs/domain/entities/blogs_entitie.dart';
import '../../domain/repositories/products_repositories.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../../../blogs/domain/usecases/get_blogs_usecase.dart';

class AllProductsRepositoriesImpl extends AllProductsRepositories {
  BaseAllProductsRemoteDataSource baseAllProductsRemoteDataSource;
  AllProductsRepositoriesImpl(this.baseAllProductsRemoteDataSource);

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
}
