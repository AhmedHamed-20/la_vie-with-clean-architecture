import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/forums_me_entitie.dart';
import '../repositories/forums_repositories.dart';

class ForumsMeUsecase extends UseCase<List<ForumsMeEntitie>, ForumsMeParams> {
  final ForumsRepositories forumRepository;

  ForumsMeUsecase(this.forumRepository);

  @override
  Future<Either<Failure, List<ForumsMeEntitie>>> call(
      ForumsMeParams params) async {
    return await forumRepository.getForumsMe(params);
  }
}

class ForumsMeParams extends Equatable {
  final String accessToken;

  const ForumsMeParams({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
