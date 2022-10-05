import 'package:equatable/equatable.dart';

class ForumsCommentsEtitie extends Equatable {
  final String forumsId;
  final String userId;
  final String comment;
  final String forumsCommentId;
  final String createdAt;

  const ForumsCommentsEtitie({
    required this.userId,
    required this.forumsId,
    required this.comment,
    required this.forumsCommentId,
    required this.createdAt,
  });
  @override
  List<Object> get props => [
        forumsId,
        userId,
        comment,
        forumsCommentId,
        createdAt,
      ];
}
