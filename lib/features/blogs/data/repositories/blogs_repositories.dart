import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/data/datasource/blogs_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/entities/blogs_entitie.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/repositories/blogs_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/usecases/get_blogs_usecase.dart';

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
