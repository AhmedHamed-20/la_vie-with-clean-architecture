import '../../domain/entities/updated_user_entitie.dart';

class UpdatedUserDataModel extends UpdatedUserDataEntitie {
  const UpdatedUserDataModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.address,
    required super.imageUrl,
    required super.userId,
  });

  factory UpdatedUserDataModel.fromJson(Map<String, dynamic> json) {
    return UpdatedUserDataModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      userId: json['userId'],
    );
  }

  static Map<String, dynamic> toJson(
      {required String firstName,
      required String lastName,
      required String email,
      required String address}) {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
    };
  }
}
