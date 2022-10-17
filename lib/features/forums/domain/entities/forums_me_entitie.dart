import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/entities/forums_user_entitie.dart';

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
  final ForumsUserEntitie forumsUserEntitie;
  const ForumsMeEntitie({
    required this.forumsUserEntitie,
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
        forumsUserEntitie,
        forumsCommentsEtitie
      ];
}
