import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';

import '../../../../core/layout/features/main_layout/domain/entities/notifications_entitie.dart';

class NotificationsModel extends NotificationsEntitie {
  const NotificationsModel(
      {required super.notificationId,
      required super.userId,
      required super.imageUrl,
      required super.message,
      required super.createdAt});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      notificationId: json['notificationId'],
      userId: json['userId'],
      imageUrl: json['imageUrl'] == '' || json['imageUrl'] == null
          ? defaultImage
          : json['imageUrl'],
      message: json['message'],
      createdAt: json['createdAt'],
    );
  }
}
