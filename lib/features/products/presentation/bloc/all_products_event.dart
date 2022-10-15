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
  final int amount;

  const DatabaseInsertionEvent({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        productId,
        name,
        description,
        imageUrl,
        price,
        amount,
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

class CurrentActiveTabIndexEvent extends BaseAllProductsEvent {
  final int currentActiveTabIndex;

  const CurrentActiveTabIndexEvent({required this.currentActiveTabIndex});

  @override
  List<Object?> get props => [currentActiveTabIndex];
}

class AmountMapEvent extends BaseAllProductsEvent {
  final List<AllProductsEntitie> allProducts;

  const AmountMapEvent(this.allProducts);

  @override
  List<Object?> get props => [allProducts];
}

class AmountValueEvent extends BaseAllProductsEvent {
  final String id;
  final bool isIncrement;

  const AmountValueEvent({required this.id, required this.isIncrement});

  @override
  List<Object?> get props => [id, isIncrement];
}

class LogoutEvent extends BaseAllProductsEvent {
  final String tableName;
  final String cacheKey;

  const LogoutEvent(this.tableName, this.cacheKey);

  @override
  List<Object?> get props => [tableName, cacheKey];
}

class AmountOfProductsInCartEvent extends BaseAllProductsEvent {
  final int dataBaseProductsId;
  final int amount;
  final bool isIncrement;

  const AmountOfProductsInCartEvent(
      {required this.dataBaseProductsId,
      required this.isIncrement,
      required this.amount});

  @override
  List<Object?> get props => [dataBaseProductsId, isIncrement, amount];
}
