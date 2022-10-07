import '../../../../core/database/database_setup.dart';
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
      );

      await DatabaseProvider.insertIntoDataBase(
          data: [
            convertedMap['productId'],
            convertedMap['name'],
            convertedMap['description'],
            convertedMap['imageUrl'],
            convertedMap['price'],
          ],
          query:
              '''INSERT INTO products(productId,name,description,imageUrl,price) VALUES(?, ?, ?, ?, ?)''');
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          DataBaseErrorMessageModel.fromException(exceptions.result));
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
          DataBaseErrorMessageModel.fromException(exceptions.result));
    }
  }

  @override
  Future<int> deleteProductFromDatabaseById(
      ProductDeletionFromDatabaseParams params) async {
    try {
      final result = await DatabaseProvider.deleteReimnderFromDatabaseById(
          id: params.databaseIds, tableName: params.tableName);
      return result;
    } on DatabaseException catch (exceptions) {
      throw AppDataBaseException(
          DataBaseErrorMessageModel.fromException(exceptions.result));
    }
  }
}

// final String productId;
//   final String name;
//   final String description;
//   final String imageUrl;
//   final int price;