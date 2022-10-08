import 'package:equatable/equatable.dart';

class UpdatedUserDataEntitie extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final String userId;
  final String address;

  const UpdatedUserDataEntitie({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.userId,
    required this.address,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        imageUrl,
        userId,
        address,
      ];
}
