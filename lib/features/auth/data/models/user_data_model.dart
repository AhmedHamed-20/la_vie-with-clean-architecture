import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/user_data.dart';

class UserDataModel extends UserDataEntitie {
  const UserDataModel(
      {required super.userId,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.imageUrl});
  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        imageUrl: json['imageUrl'],
      );
}
