import 'package:equatable/equatable.dart';

class ForumsLikesEntitie extends Equatable {
  final String userId;
  final String formsId;
  const ForumsLikesEntitie({
    required this.userId,
    required this.formsId,
  });

  factory ForumsLikesEntitie.fromJson(Map<String, dynamic> json) {
    return ForumsLikesEntitie(
      userId: json['userId'],
      formsId: json['forumsId'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        userId,
        formsId,
      ];
}
