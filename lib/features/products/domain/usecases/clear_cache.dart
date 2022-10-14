import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/repositories/products_repositories.dart';

class CacheClearUsecase extends UseCase<bool, CacheClearParams> {
  final AllProductsRepositories allProductsRepositories;

  CacheClearUsecase(this.allProductsRepositories);
  @override
  Future<Either<Failure, bool>> call(CacheClearParams params) async {
    return await allProductsRepositories.clearUserCache(params);
  }
}

class CacheClearParams extends Equatable {
  final String key;

  const CacheClearParams(this.key);

  @override
  List<Object?> get props => [key];
}
