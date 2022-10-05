import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/entities/forums_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/usecases/get_all_forums.dart';

import '../../../../core/error/failures.dart';

abstract class ForumsRepositories {
  Future<Either<Failure, List<ForumsEntitie>>> getAllForums(
      AllForumsParams params);
}
