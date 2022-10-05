import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/entities/forums_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/repositories/forums_repositories.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class AllForumsUsecase extends UseCase<List<ForumsEntitie>, AllForumsParams> {
  final ForumsRepositories forumRepository;

  AllForumsUsecase(this.forumRepository);

  @override
  Future<Either<Failure, List<ForumsEntitie>>> call(
      AllForumsParams params) async {
    return await forumRepository.getAllForums(params);
  }
}

class AllForumsParams extends Equatable {
  final String accessToken;

  const AllForumsParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
