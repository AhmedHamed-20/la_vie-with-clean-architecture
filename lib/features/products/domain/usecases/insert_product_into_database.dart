import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/products_repositories.dart';

class ProductsInsertionIntoDatabaseUsecase
    extends UseCase<void, DatabaseProductParams> {
  final AllProductsRepositories allProductsRepositories;

  ProductsInsertionIntoDatabaseUsecase(this.allProductsRepositories);
  @override
  Future<Either<Failure, void>> call(params) async {
    return await allProductsRepositories.insertProductIntoDatabase(params);
  }
}

class DatabaseProductParams extends Equatable {
  final String productId;
  final String name;
  final String description;
  final String imageUrl;
  final int price;

  const DatabaseProductParams(
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
