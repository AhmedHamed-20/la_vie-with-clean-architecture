import '../../domain/entities/products_database_entitie.dart';

class ProductsDatabaseModel extends ProductsDatabaseEntitie {
  const ProductsDatabaseModel(
      {required super.productId,
      required super.databaseId,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.price});

  factory ProductsDatabaseModel.fromMap(Map<String, dynamic> map) {
    return ProductsDatabaseModel(
      productId: map['productId'],
      name: map['name'],
      databaseId: map['id'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price'],
    );
  }

  static Map<String, dynamic> toMap(
      {required String productId,
      required String name,
      required String description,
      required String imageUrl,
      required int price}) {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
