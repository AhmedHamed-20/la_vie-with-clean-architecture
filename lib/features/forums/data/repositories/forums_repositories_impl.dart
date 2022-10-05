import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/forums_entitie.dart';
import '../../domain/repositories/forums_repositories.dart';
import '../../domain/usecases/get_all_forums.dart';
import '../datasources/all_forums_remote_datasource.dart';

class ForumsRepositoriesImpl extends ForumsRepositories {
  final BaseAllForumsRemoteDatesource baseremoteDataSource;

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
}
