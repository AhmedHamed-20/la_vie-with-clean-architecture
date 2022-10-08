import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/entities/updated_user_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/repositories/updated_user_data_repository.dart';

class UpdateUserDataUsecase
    extends UseCase<UpdatedUserDataEntitie, UpdatedUserDataParams> {
  final UpdatedUserDataRepository updatedUserDataRepository;

  UpdateUserDataUsecase(this.updatedUserDataRepository);

  @override
  Future<Either<Failure, UpdatedUserDataEntitie>> call(
      UpdatedUserDataParams params) async {
    return await updatedUserDataRepository.updateUserData(params);
  }
}

class UpdatedUserDataParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String accessToken;

  const UpdatedUserDataParams(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.accessToken});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        address,
        accessToken,
      ];
}
