import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/blogs_entitie.dart';
import '../repositories/blogs_repositories.dart';

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
