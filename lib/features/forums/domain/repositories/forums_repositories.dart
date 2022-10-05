import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/forums_entitie.dart';
import '../usecases/get_all_forums.dart';

abstract class ForumsRepositories {
  Future<Either<Failure, List<ForumsEntitie>>> getAllForums(
      AllForumsParams params);
}
