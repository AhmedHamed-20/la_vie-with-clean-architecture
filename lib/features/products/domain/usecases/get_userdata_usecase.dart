import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/repositories/products_repositories.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/user_data.dart';

class UserDataUsecase implements UseCase<UserDataEntitie, UserDataParams> {
  final AllProductsRepositories allProductsRepositories;
  UserDataUsecase(this.allProductsRepositories);

  @override
  Future<Either<Failure, UserDataEntitie>> call(UserDataParams params) async {
    return await allProductsRepositories.getUserData(params);
  }
}

class UserDataParams extends Equatable {
  final String accessToken;

  const UserDataParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
