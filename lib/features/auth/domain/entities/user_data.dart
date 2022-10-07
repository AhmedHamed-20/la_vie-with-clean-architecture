import 'package:equatable/equatable.dart';

import 'notifications_entitie.dart';

class UserDataEntitie extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final int userPoints;
  final List<NotificationsEntitie> userNotification;
  const UserDataEntitie(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.imageUrl,
      required this.userPoints,
      required this.userNotification});
  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        email,
        imageUrl,
        userPoints,
        userNotification
      ];
}
