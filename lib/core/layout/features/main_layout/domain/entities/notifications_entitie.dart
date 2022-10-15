import 'package:equatable/equatable.dart';

class NotificationsEntitie extends Equatable {
  final String notificationId;
  final String userId;
  final String imageUrl;
  final String message;
  final String createdAt;

  const NotificationsEntitie(
      {required this.notificationId,
      required this.userId,
      required this.imageUrl,
      required this.message,
      required this.createdAt});

  @override
  List<Object?> get props => [];
}
