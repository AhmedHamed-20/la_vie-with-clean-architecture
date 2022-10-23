import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/scan/data/datasources/product_by_id_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/product_by_id_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/repositories/product_by_id_repository.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/usecases/get_product_by_id.dart';

class ProductByIdRepositoryImpl extends ProductByIdRepository {
  final BaseProductByIdRemoteDataSource baseProductByIdRemoteDataSource;

  ProductByIdRepositoryImpl(this.baseProductByIdRemoteDataSource);
  @override
  Future<Either<Failure, ProductByIdEntitie>> getProductById(
      ProductByIdParams params) async {
    try {
      final result =
          await baseProductByIdRemoteDataSource.getProductById(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.type));
    }
  }
}
