import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/entities/blogs_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/repositories/blogs_repositories.dart';

class BlogsUsecase extends UseCase<BLogsEntitie, BlogsParams> {
  final BlogRepositories blogRepositories;

  BlogsUsecase(this.blogRepositories);
  @override
  Future<Either<Failure, BLogsEntitie>> call(BlogsParams params) async {
    return await blogRepositories.getBlogs(params);
  }
}

class BlogsParams extends Equatable {
  final String accessToken;
  const BlogsParams(this.accessToken);
  @override
  List<Object?> get props => [accessToken];
}
