import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/repositories/forums_repositories.dart';

class LikeAddUsecase extends UseCase<dynamic, LikesAddParams> {
  final ForumsRepositories forumsRepositories;

  LikeAddUsecase(this.forumsRepositories);
  @override
  Future<Either<Failure, dynamic>> call(LikesAddParams params) async {
    return await forumsRepositories.addLikeToPost(params);
  }
}

class LikesAddParams extends Equatable {
  final String accessToken;
  final String forumId;

  const LikesAddParams(this.forumId, this.accessToken);

  @override
  List<Object?> get props => [forumId, accessToken];
}
