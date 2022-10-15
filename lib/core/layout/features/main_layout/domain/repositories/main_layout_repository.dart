import 'package:dartz/dartz.dart';

import '../../../../../error/failures.dart';
import '../entities/user_data.dart';
import '../usecases/get_access_token_from_cache.dart';
import '../usecases/get_userdata_usecase.dart';

abstract class MainLayoutRepository {
  Future<Either<Failure, UserDataEntitie>> getUserData(UserDataParams params);
  Future<Either<Failure, dynamic>> getAccessTokenFromCache(
      AccessTokenFromCacheParams params);
}
