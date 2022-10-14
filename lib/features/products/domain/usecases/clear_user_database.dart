import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';

import '../repositories/products_repositories.dart';

class UserCartDataBaseClearUsecase
    extends UseCase<int, UserCartDataBaseClearParams> {
  final AllProductsRepositories allProductsRepositories;

  UserCartDataBaseClearUsecase(this.allProductsRepositories);
  @override
  Future<Either<Failure, int>> call(UserCartDataBaseClearParams params) async {
    return await allProductsRepositories.clearUserCartDataBase(params);
  }
}

class UserCartDataBaseClearParams extends Equatable {
  final String tableName;

  const UserCartDataBaseClearParams(this.tableName);

  @override
  List<Object?> get props => [tableName];
}
