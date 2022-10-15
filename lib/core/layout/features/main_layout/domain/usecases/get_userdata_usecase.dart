import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/repositories/main_layout_repository.dart';
import '../../../../../error/failures.dart';
import '../../../../../usecases/usecases.dart';
import '../entities/user_data.dart';

class UserDataUsecase implements UseCase<UserDataEntitie, UserDataParams> {
  final MainLayoutRepository mainLayoutRepository;
  UserDataUsecase(this.mainLayoutRepository);

  @override
  Future<Either<Failure, UserDataEntitie>> call(UserDataParams params) async {
    return await mainLayoutRepository.getUserData(params);
  }
}

class UserDataParams extends Equatable {
  final String accessToken;

  const UserDataParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
