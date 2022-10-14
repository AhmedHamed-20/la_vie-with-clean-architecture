import 'package:la_vie_with_clean_architecture/core/cache/cache_helper.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/clear_cache.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/clear_user_database.dart';

import '../../../../core/database/database_setup.dart';
import '../../domain/usecases/get_access_token_from_cache.dart';
import '../models/products_database_model.dart';
import '../../domain/usecases/get_all_products_from_database.dart';
import '../../domain/usecases/insert_product_into_database.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/usecases/delete_product_from_database.dart';

abstract class BaseAllProductsLocalDataSource {
  Future<void> insertProductIntoDatabase(DatabaseProductParams params);
  Future<List<ProductsDatabaseModel>> getProductsFromDatabase(
      ProductsFromDatabaseParams params);
  Future<int> deleteProductFromDatabaseById(
      ProductDeletionFromDatabaseParams params);
  Future<dynamic> getAccessTokenFromCache(AccessTokenFromCacheParams params);
  Future<int> clearUserCartDataBase(UserCartDataBaseClearParams params);
  Future<bool> clearUserCache(CacheClearParams params);
}

class AllProductLocalDataSourceImpl extends BaseAllProductsLocalDataSource {
  @override
  Future<void> insertProductIntoDatabase(DatabaseProductParams params) async {
    try {
      final convertedMap = ProductsDatabaseModel.toMap(
        productId: params.productId,
        name: params.name,
        description: params.description,
        imageUrl: params.imageUrl,
        price: params.price,
        amount: params.amount,
      );

      await DatabaseProvider.insertIntoDataBase(
          data: [
            convertedMap['productId'],
            convertedMap['name'],
            convertedMap['description'],
            convertedMap['imageUrl'],
            convertedMap['price'],
            convertedMap['amount'],
          ],
          query:
              '''INSERT INTO cart(productId,name,description,imageUrl,price,amount) VALUES(?, ?, ?, ?, ?, ?)''');
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          LocalErrorsMessageModel.fromException(exceptions.result));
    }
  }

  @override
  Future<List<ProductsDatabaseModel>> getProductsFromDatabase(
      ProductsFromDatabaseParams params) async {
    try {
      final result =
          await DatabaseProvider.getAllDataFromDatabase(params.tableName);

      return List.from(result.map((e) => ProductsDatabaseModel.fromMap(e)));
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          LocalErrorsMessageModel.fromException(exceptions.result));
    }
  }

  @override
  Future<int> deleteProductFromDatabaseById(
      ProductDeletionFromDatabaseParams params) async {
    try {
      final result = await DatabaseProvider.deleteUserCartFromDatabaseById(
          id: params.databaseIds, tableName: params.tableName);
      return result;
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          LocalErrorsMessageModel.fromException(exceptions.result));
    }
  }

  @override
  Future getAccessTokenFromCache(AccessTokenFromCacheParams params) async {
    try {
      final result = await CacheHelper.getData(key: params.key);
      return result;
    } on Exception catch (e) {
      throw CacheException(LocalErrorsMessageModel(errorMessage: e.toString()));
    }
  }

  @override
  Future<bool> clearUserCache(CacheClearParams params) async {
    try {
      final result = await CacheHelper.removeData(params.key);
      return result;
    } on Exception catch (e) {
      throw CacheException(LocalErrorsMessageModel.fromException(e.toString()));
    }
  }

  @override
  Future<int> clearUserCartDataBase(UserCartDataBaseClearParams params) async {
    try {
      final result = await DatabaseProvider.deleteAllUserCartsFromDatabase(
          tableName: params.tableName);
      return result;
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          LocalErrorsMessageModel.fromException(exceptions.result));
    }
  }
}

// final String productId;
//   final String name;
//   final String description;
//   final String imageUrl;
//   final int price;