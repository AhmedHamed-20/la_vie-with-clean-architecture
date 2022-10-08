import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/data/datasources/updated_user_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/entities/updated_user_entitie.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/repositories/updated_user_data_repository.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/usecases/update_user_data.dart';

class UpdatedUserDataRepositoryImpl extends UpdatedUserDataRepository {
  final BaseUpdatedUserRemoteDatasource baseUpdatedUserRemoteDatasource;

  UpdatedUserDataRepositoryImpl(this.baseUpdatedUserRemoteDatasource);
  @override
  Future<Either<Failure, UpdatedUserDataEntitie>> updateUserData(
      UpdatedUserDataParams params) async {
    try {
      final result =
          await baseUpdatedUserRemoteDatasource.updateUserData(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }
}
