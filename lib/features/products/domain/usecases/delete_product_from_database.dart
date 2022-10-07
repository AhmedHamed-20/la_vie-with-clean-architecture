import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/products_repositories.dart';

class ProductDeletionFromDatabaseByIdUsecase
    extends UseCase<int, ProductDeletionFromDatabaseParams> {
  final AllProductsRepositories allProductsRepositories;

  ProductDeletionFromDatabaseByIdUsecase(this.allProductsRepositories);
  @override
  Future<Either<Failure, int>> call(
      ProductDeletionFromDatabaseParams params) async {
    return await allProductsRepositories.deleteProductFromDatabase(params);
  }
}

class ProductDeletionFromDatabaseParams extends Equatable {
  final int databaseIds;
  final String tableName;

  const ProductDeletionFromDatabaseParams({
    required this.databaseIds,
    required this.tableName,
  });

  @override
  List<Object?> get props => [
        databaseIds,
        tableName,
      ];
}
