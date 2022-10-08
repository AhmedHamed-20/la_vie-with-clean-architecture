import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/entities/updated_user_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/usecases/update_user_data.dart';

import '../../../../core/error/failures.dart';

abstract class UpdatedUserDataRepository {
  Future<Either<Failure, UpdatedUserDataEntitie>> updateUserData(
      UpdatedUserDataParams params);
}
