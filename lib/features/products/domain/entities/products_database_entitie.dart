import 'package:equatable/equatable.dart';

class ProductsDatabaseEntitie extends Equatable {
  final int databaseId;
  final String productId;
  final String name;
  final String description;
  final String imageUrl;
  final int price;

  const ProductsDatabaseEntitie({
    required this.databaseId,
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
  @override
  List<Object?> get props => [
        productId,
        databaseId,
        name,
        description,
        imageUrl,
        price,
      ];
}
