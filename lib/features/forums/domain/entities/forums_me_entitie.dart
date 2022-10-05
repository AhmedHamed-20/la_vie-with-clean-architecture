import 'package:equatable/equatable.dart';

import 'forums_comments_entitie.dart';
import 'forums_likes_entitie.dart';

class ForumsMeEntitie extends Equatable {
  final String forumsId;
  final String userId;
  final String title;
  final String description;
  final String image;
  final List<ForumsLikesEntitie> formsLikesEntitie;
  final List<ForumsCommentsEtitie> forumsCommentsEtitie;

  const ForumsMeEntitie({
    required this.userId,
    required this.forumsId,
    required this.title,
    required this.description,
    required this.image,
    required this.formsLikesEntitie,
    required this.forumsCommentsEtitie,
  });

  @override
  List<Object> get props => [
        forumsId,
        title,
        description,
        image,
        formsLikesEntitie,
        forumsCommentsEtitie
      ];
}
