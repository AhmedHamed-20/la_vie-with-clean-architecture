import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/auth_entitie.dart';

import '../repositories/auth_repositories.dart';

class LoginUsecase implements UseCase<AuthDataEntitie, LoginParams> {
  final AuthRepositories authRepositories;
  LoginUsecase(this.authRepositories);

  @override
  Future<Either<Failure, AuthDataEntitie>> call(LoginParams params) async {
    return await authRepositories.login(params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
