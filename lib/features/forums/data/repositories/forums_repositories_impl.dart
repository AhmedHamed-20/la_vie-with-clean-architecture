import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/get_forums_me.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/entities/forums_me_entitie.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/forums_entitie.dart';
import '../../domain/repositories/forums_repositories.dart';
import '../../domain/usecases/get_all_forums.dart';
import '../datasources/forums_remote_datasource.dart';

class ForumsRepositoriesImpl extends ForumsRepositories {
  final BaseForumsRemoteDatesource baseremoteDataSource;

  ForumsRepositoriesImpl(
    this.baseremoteDataSource,
  );

  @override
  Future<Either<Failure, List<ForumsEntitie>>> getAllForums(
      AllForumsParams params) async {
    try {
      final forums = await baseremoteDataSource.getAllForums(params);

      return Right(forums);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<ForumsMeEntitie>>> getForumsMe(
      ForumsMeParams params) async {
    try {
      final forumsMe = await baseremoteDataSource.getForumsMe(params);

      return Right(forumsMe);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
