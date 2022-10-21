import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/repositories/forums_repositories.dart';

class CommentsAddingUsecase extends UseCase<dynamic, CommentsAddingParams> {
  final ForumsRepositories forumsRepositories;

  CommentsAddingUsecase(this.forumsRepositories);
  @override
  Future<Either<Failure, dynamic>> call(CommentsAddingParams params) async {
    return await forumsRepositories.addCommentToPost(params);
  }
}

class CommentsAddingParams extends Equatable {
  final String accessToken;
  final String forumId;
  final String comment;

  const CommentsAddingParams(this.accessToken, this.forumId, this.comment);

  @override
  List<Object?> get props => [accessToken, forumId, comment];
}
