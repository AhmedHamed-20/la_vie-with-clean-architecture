import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/repositories/auth_repositories.dart';

class AccessTokenCacheUsecase extends UseCase<bool, AccessTokenCacheParams> {
  final AuthRepositories authRepositories;

  AccessTokenCacheUsecase(this.authRepositories);

  @override
  Future<Either<Failure, bool>> call(AccessTokenCacheParams params) async {
    return await authRepositories.cacheAccessToken(params);
  }
}

class AccessTokenCacheParams extends Equatable {
  final String accessToken;

  const AccessTokenCacheParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
