import '../../domain/entities/forums_comments_entitie.dart';

class ForumsCommentsModel extends ForumsCommentsEtitie {
  const ForumsCommentsModel(
      {required super.userId,
      required super.forumsId,
      required super.comment,
      required super.forumsCommentId,
      required super.createdAt});

  factory ForumsCommentsModel.fromJson(Map<String, dynamic> json) {
    return ForumsCommentsModel(
      userId: json['userId'],
      forumsId: json['forumsId'] ?? '',
      comment: json['comment'] ?? '',
      forumsCommentId: json['forumsCommentId'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }
}
