import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/auth_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/user_data.dart';

import '../repositories/auth_repositories.dart';

class UserDataUsecase implements UseCase<UserDataEntitie, UserDataParams> {
  final AuthRepositories authRepositories;
  UserDataUsecase(this.authRepositories);

  @override
  Future<Either<Failure, UserDataEntitie>> call(UserDataParams params) async {
    return await authRepositories.getUserData(params);
  }
}

class UserDataParams extends Equatable {
  final String accessToken;

  const UserDataParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
