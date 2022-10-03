import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/entities/blogs_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/usecases/get_blogs_usecase.dart';

abstract class BlogRepositories {
  Future<Either<Failure, BLogsEntitie>> getBlogs(BlogsParams params);
}
