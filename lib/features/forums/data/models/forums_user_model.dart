import 'package:la_vie_with_clean_architecture/features/forums/domain/entities/forums_user_entitie.dart';

class ForumsUserModel extends ForumsUserEntitie {
  const ForumsUserModel(
      {required super.firstName,
      required super.lastName,
      required super.imageUrl});

  factory ForumsUserModel.fromJson(Map<String, dynamic> json) {
    return ForumsUserModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        imageUrl: json['imageUrl']);
  }
}
