import '../../domain/entities/user_data.dart';
import 'notifications_model.dart';

class UserDataModel extends UserDataEntitie {
  const UserDataModel({
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.imageUrl,
    required super.userPoints,
    required super.userNotification,
  });
  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        imageUrl: json['imageUrl'],
        userPoints: json['userPoints'] ?? 0,
        userNotification: List<NotificationsModel>.from(
          json['UserNotification'].map(
            (e) => NotificationsModel.fromJson(e),
          ),
        ),
      );
}
