import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_comment_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_like.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/search_in_forums_by_name.dart';

import '../../../../core/error/failures.dart';
import '../entities/forums_entitie.dart';
import '../entities/forums_me_entitie.dart';
import '../usecases/get_all_forums.dart';
import '../usecases/get_forums_me.dart';
import '../usecases/post_new_forums.dart';

abstract class ForumsRepositories {
  Future<Either<Failure, List<ForumsEntitie>>> getAllForums(
      AllForumsParams params);
  Future<Either<Failure, List<ForumsMeEntitie>>> getForumsMe(
      ForumsMeParams params);
  Future<Either<Failure, void>> postNewForum(ForumsPostParams params);
  Future<Either<Failure, dynamic>> addLikeToPost(LikesAddParams params);
  Future<Either<Failure, dynamic>> addCommentToPost(
      CommentsAddingParams params);
  Future<Either<Failure, List<ForumsEntitie>>> searchForumByTitle(
      ForumsSearchByTitleParams params);
}
