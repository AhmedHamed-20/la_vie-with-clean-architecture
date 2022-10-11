import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/repositories/products_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_all_products_usecase.dart';

class AccessTokenFromCacheUsecase
    extends UseCase<dynamic, AccessTokenFromCacheParams> {
  final AllProductsRepositories allProductsRepositories;

  AccessTokenFromCacheUsecase(this.allProductsRepositories);
  @override
  Future<Either<Failure, dynamic>> call(
      AccessTokenFromCacheParams params) async {
    return await allProductsRepositories.getAccessTokenFromCache(params);
  }
}

class AccessTokenFromCacheParams extends Equatable {
  final String key;

  const AccessTokenFromCacheParams(this.key);

  @override
  List<Object?> get props => [key];
}
