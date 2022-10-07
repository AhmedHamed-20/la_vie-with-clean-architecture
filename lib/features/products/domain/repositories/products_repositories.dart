import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/all_products_entitie.dart';
import '../entities/products_database_entitie.dart';
import '../usecases/delete_product_from_database.dart';
import '../usecases/get_all_products_from_database.dart';
import '../usecases/get_all_products_usecase.dart';
import '../usecases/insert_product_into_database.dart';

abstract class AllProductsRepositories {
  Future<Either<Failure, List<AllProductsEntitie>>> getAllProducts(
      AllproudctsParams params);

  Future<Either<Failure, void>> insertProductIntoDatabase(
      DatabaseProductParams params);
  Future<Either<Failure, List<ProductsDatabaseEntitie>>>
      getProductsFromDatabase(ProductsFromDatabaseParams params);
  Future<Either<Failure, int>> deleteProductFromDatabase(
      ProductDeletionFromDatabaseParams params);
}
