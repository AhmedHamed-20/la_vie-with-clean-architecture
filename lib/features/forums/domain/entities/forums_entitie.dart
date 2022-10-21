import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/entities/forums_user_entitie.dart';

import 'forums_comments_entitie.dart';
import 'forums_likes_entitie.dart';

class ForumsEntitie extends Equatable {
  final String forumsId;
  final String userId;
  final String title;
  final String description;
  final String image;
  final List<ForumsLikesEntitie> forumsLikesEntitie;
  final List<ForumsCommentsEtitie> forumsCommentsEtitie;
  final ForumsUserEntitie forumsUserEntitie;

  const ForumsEntitie({
    required this.forumsUserEntitie,
    required this.userId,
    required this.forumsId,
    required this.title,
    required this.description,
    required this.image,
    required this.forumsLikesEntitie,
    required this.forumsCommentsEtitie,
  });

  @override
  List<Object> get props => [
        forumsUserEntitie,
        forumsId,
        title,
        description,
        image,
        forumsLikesEntitie,
        forumsCommentsEtitie
      ];
}
