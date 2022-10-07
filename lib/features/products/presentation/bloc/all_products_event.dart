part of 'all_products_bloc.dart';

abstract class BaseAllProductsEvent extends Equatable {
  const BaseAllProductsEvent();
}

class AllProductsEvent extends BaseAllProductsEvent {
  final String accessToken;

  const AllProductsEvent(this.accessToken);
  @override
  List<Object?> get props => [accessToken];
}

class BLogsEvent extends BaseAllProductsEvent {
  final String accessToken;

  const BLogsEvent(this.accessToken);
  @override
  List<Object?> get props => [accessToken];
}

class DatabaseInsertionEvent extends BaseAllProductsEvent {
  final String productId;
  final String name;
  final String description;
  final String imageUrl;
  final int price;

  const DatabaseInsertionEvent(
      {required this.productId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price});

  @override
  List<Object?> get props => [
        productId,
        name,
        description,
        imageUrl,
        price,
      ];
}

class AllProductsFromDatabaseEvent extends BaseAllProductsEvent {
  final String tableName;

  const AllProductsFromDatabaseEvent(this.tableName);
  @override
  List<Object?> get props => [tableName];
}

class ProductDeletionFromDatabaseByIdEvent extends BaseAllProductsEvent {
  final String tableName;
  final int databaseId;

  const ProductDeletionFromDatabaseByIdEvent(this.tableName, this.databaseId);
  @override
  List<Object?> get props => [tableName, databaseId];
}
