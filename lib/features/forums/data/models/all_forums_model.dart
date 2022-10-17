import 'package:la_vie_with_clean_architecture/features/forums/data/models/forums_user_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/entities/forums_entitie.dart';
import '../../domain/entities/forums_likes_entitie.dart';
import 'forums_comments_model.dart';

class AllForumsModel extends ForumsEntitie {
  const AllForumsModel(
      {required super.userId,
      required super.forumsUserEntitie,
      required super.forumsId,
      required super.title,
      required super.description,
      required super.image,
      required super.formsLikesEntitie,
      required super.forumsCommentsEtitie});

  factory AllForumsModel.fromJson(Map<String, dynamic> json) {
    return AllForumsModel(
      forumsUserEntitie: ForumsUserModel.fromJson(json['user']),
      userId: json['userId'],
      forumsId: json['forumId'] ?? '',
      title: json['title'],
      description: json['description'],
      image: json['imageUrl'] == null || json['imageUrl'] == ''
          ? defaultImage
          : EndPoints.baseUrl + json['imageUrl'],
      formsLikesEntitie: List.from((json['ForumLikes'] as List)
          .map((e) => ForumsLikesEntitie.fromJson(e))),
      forumsCommentsEtitie: List.from((json['ForumComments'] as List)
          .map((e) => ForumsCommentsModel.fromJson(e))),
    );
  }
}
