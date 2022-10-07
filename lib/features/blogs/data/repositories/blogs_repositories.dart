import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/blogs_entitie.dart';
import '../../domain/repositories/blogs_repositories.dart';
import '../../domain/usecases/get_blogs_usecase.dart';
import '../datasource/blogs_remote_datasource.dart';

class BlogsRepositoriesImpl extends BlogRepositories {
  final BaseBlogsRemoteDataSource baseBlogsRemoteDataSource;

  BlogsRepositoriesImpl(this.baseBlogsRemoteDataSource);
  @override
  Future<Either<Failure, BLogsEntitie>> getBlogs(BlogsParams params) async {
    try {
      final result = await baseBlogsRemoteDataSource.getBLogs(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
