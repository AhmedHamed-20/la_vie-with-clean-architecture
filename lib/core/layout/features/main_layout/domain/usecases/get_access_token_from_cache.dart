import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/repositories/main_layout_repository.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';

class AccessTokenFromCacheUsecase
    extends UseCase<dynamic, AccessTokenFromCacheParams> {
  final MainLayoutRepository mainLayoutRepository;

  AccessTokenFromCacheUsecase(this.mainLayoutRepository);
  @override
  Future<Either<Failure, dynamic>> call(
      AccessTokenFromCacheParams params) async {
    return await mainLayoutRepository.getAccessTokenFromCache(params);
  }
}

class AccessTokenFromCacheParams extends Equatable {
  final String key;

  const AccessTokenFromCacheParams(this.key);

  @override
  List<Object?> get props => [key];
}
