import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/auth_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/user_data.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/get_userdata_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/signUp_usecase.dart';

abstract class AuthRepositories {
  Future<Either<Failure, AuthDataEntitie>> login(LoginParams params);
  Future<Either<Failure, AuthDataEntitie>> signUp(SignUpParams params);
  Future<Either<Failure, UserDataEntitie>> getUserData(UserDataParams params);
}
