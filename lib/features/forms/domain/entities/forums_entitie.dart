import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/entities/forums_comments_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/entities/forums_likes_entitie.dart';

class ForumsEntitie extends Equatable {
  final String forumsId;
  final String userId;
  final String title;
  final String description;
  final String image;
  final List<ForumsLikesEntitie> formsLikesEntitie;
  final List<ForumsCommentsEtitie> forumsCommentsEtitie;

  const ForumsEntitie({
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
