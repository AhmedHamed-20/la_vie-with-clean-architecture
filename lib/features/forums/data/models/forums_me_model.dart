import 'package:la_vie_with_clean_architecture/features/forums/data/models/forums_user_model.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/entities/forums_user_entitie.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/entities/forums_likes_entitie.dart';
import '../../domain/entities/forums_me_entitie.dart';
import 'forums_comments_model.dart';

class ForumsMeModel extends ForumsMeEntitie {
  const ForumsMeModel(
      {required super.userId,
      required super.forumsUserEntitie,
      required super.forumsId,
      required super.title,
      required super.description,
      required super.image,
      required super.formsLikesEntitie,
      required super.forumsCommentsEtitie});

  factory ForumsMeModel.fromJson(Map<String, dynamic> json) {
    return ForumsMeModel(
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
