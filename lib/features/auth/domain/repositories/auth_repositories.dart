import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/cache_access_token.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_entitie.dart';
import '../../../products/domain/entities/user_data.dart';
import '../../../products/domain/usecases/get_userdata_usecase.dart';
import '../usecases/login_usecase.dart';
import '../usecases/signUp_usecase.dart';

abstract class AuthRepositories {
  Future<Either<Failure, AuthDataEntitie>> login(LoginParams params);
  Future<Either<Failure, AuthDataEntitie>> signUp(SignUpParams params);
  Future<Either<Failure, bool>> cacheAccessToken(AccessTokenCacheParams params);
}
