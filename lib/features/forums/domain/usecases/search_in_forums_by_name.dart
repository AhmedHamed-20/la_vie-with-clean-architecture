import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/entities/forums_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/repositories/forums_repositories.dart';

class ForumsSearchByTitleUsecase
    extends UseCase<List<ForumsEntitie>, ForumsSearchByTitleParams> {
  final ForumsRepositories forumsRepositories;

  ForumsSearchByTitleUsecase(this.forumsRepositories);
  @override
  Future<Either<Failure, List<ForumsEntitie>>> call(
      ForumsSearchByTitleParams params) async {
    return await forumsRepositories.searchForumByTitle(params);
  }
}

class ForumsSearchByTitleParams extends Equatable {
  final String accessToken;
  final String forumTitle;

  const ForumsSearchByTitleParams(this.accessToken, this.forumTitle);

  @override
  List<Object?> get props => [accessToken, forumTitle];
}
