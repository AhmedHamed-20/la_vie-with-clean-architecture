import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/auth_entitie.dart';

import '../repositories/auth_repositories.dart';

class SignupUscase implements UseCase<AuthDataEntitie, SignUpParams> {
  final AuthRepositories authRepositories;
  SignupUscase(this.authRepositories);

  @override
  Future<Either<Failure, AuthDataEntitie>> call(SignUpParams params) async {
    return await authRepositories.signUp(params);
  }
}

class SignUpParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  const SignUpParams(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  @override
  List<Object?> get props => [email, password, firstName, lastName];
}
