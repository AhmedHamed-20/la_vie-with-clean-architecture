import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/all_products_entitie.dart';
import '../repositories/products_repositories.dart';

class AllProductsUseCase
    extends UseCase<List<AllProductsEntitie>, AllproudctsParams> {
  AllProductsRepositories allProductsRepositories;
  AllProductsUseCase(this.allProductsRepositories);
  @override
  Future<Either<Failure, List<AllProductsEntitie>>> call(
      AllproudctsParams params) async {
    return await allProductsRepositories.getAllProducts(params);
  }
}

class AllproudctsParams extends Equatable {
  final String accessToken;

  const AllproudctsParams(this.accessToken);
  @override
  List<Object?> get props => [
        accessToken,
      ];
}
