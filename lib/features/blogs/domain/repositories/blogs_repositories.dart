import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/blogs_entitie.dart';
import '../usecases/get_blogs_usecase.dart';

abstract class BlogRepositories {
  Future<Either<Failure, BLogsEntitie>> getBlogs(BlogsParams params);
}
