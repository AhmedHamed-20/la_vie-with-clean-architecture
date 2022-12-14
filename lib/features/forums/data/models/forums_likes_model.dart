import '../../domain/entities/forums_likes_entitie.dart';

class ForumsLikesModel extends ForumsLikesEntitie {
  const ForumsLikesModel({required super.userId, required super.formsId});

  factory ForumsLikesModel.fromJson(Map<String, dynamic> json) {
    return ForumsLikesModel(
      userId: json['userId'],
      formsId: json['forumsId'] ?? '',
    );
  }
}
