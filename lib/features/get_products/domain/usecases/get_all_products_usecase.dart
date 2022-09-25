import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/get_all_products_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/repositories/get_all_products_repositories.dart';

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
