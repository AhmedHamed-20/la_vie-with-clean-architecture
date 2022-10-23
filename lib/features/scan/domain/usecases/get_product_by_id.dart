import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/product_by_id_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/repositories/product_by_id_repository.dart';

class ProductByIdUsecase
    extends UseCase<ProductByIdEntitie, ProductByIdParams> {
  final ProductByIdRepository productByIdRepository;

  ProductByIdUsecase(this.productByIdRepository);
  @override
  Future<Either<Failure, ProductByIdEntitie>> call(
      ProductByIdParams params) async {
    return await productByIdRepository.getProductById(params);
  }
}

class ProductByIdParams extends Equatable {
  final String accessToken;
  final String productId;

  const ProductByIdParams(this.accessToken, this.productId);

  @override
  List<Object?> get props => [accessToken, productId];
}
