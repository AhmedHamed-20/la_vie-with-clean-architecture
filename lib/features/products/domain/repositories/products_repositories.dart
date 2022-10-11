import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_access_token_from_cache.dart';

import '../../../../core/error/failures.dart';
import '../entities/all_products_entitie.dart';
import '../entities/products_database_entitie.dart';
import '../entities/user_data.dart';
import '../usecases/delete_product_from_database.dart';
import '../usecases/get_all_products_from_database.dart';
import '../usecases/get_all_products_usecase.dart';
import '../usecases/get_userdata_usecase.dart';
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
  Future<Either<Failure, UserDataEntitie>> getUserData(UserDataParams params);

  Future<Either<Failure, dynamic>> getAccessTokenFromCache(
      AccessTokenFromCacheParams params);
}
