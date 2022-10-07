import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_entitie.dart';
import '../entities/user_data.dart';
import '../usecases/get_userdata_usecase.dart';
import '../usecases/login_usecase.dart';
import '../usecases/signUp_usecase.dart';

abstract class AuthRepositories {
  Future<Either<Failure, AuthDataEntitie>> login(LoginParams params);
  Future<Either<Failure, AuthDataEntitie>> signUp(SignUpParams params);
  Future<Either<Failure, UserDataEntitie>> getUserData(UserDataParams params);
}
