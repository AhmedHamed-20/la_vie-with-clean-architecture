import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/forms/data/models/forums_comments_model.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/entities/forums_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/entities/forums_likes_entitie.dart';

class AllForumsModel extends ForumsEntitie {
  const AllForumsModel(
      {required super.userId,
      required super.forumsId,
      required super.title,
      required super.description,
      required super.image,
      required super.formsLikesEntitie,
      required super.forumsCommentsEtitie});

  factory AllForumsModel.fromJson(Map<String, dynamic> json) {
    return AllForumsModel(
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
