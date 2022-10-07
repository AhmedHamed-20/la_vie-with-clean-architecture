import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/products_database_entitie.dart';
import '../repositories/products_repositories.dart';

class PeroductsFromDatabaseUsecase
    extends UseCase<List<ProductsDatabaseEntitie>, ProductsFromDatabaseParams> {
  final AllProductsRepositories allProductsRepositories;

  PeroductsFromDatabaseUsecase(this.allProductsRepositories);
  @override
  Future<Either<Failure, List<ProductsDatabaseEntitie>>> call(
      ProductsFromDatabaseParams params) async {
    return await allProductsRepositories.getProductsFromDatabase(params);
  }
}

class ProductsFromDatabaseParams extends Equatable {
  final String tableName;

  const ProductsFromDatabaseParams({
    required this.tableName,
  });

  @override
  List<Object?> get props => [
        tableName,
      ];
}
