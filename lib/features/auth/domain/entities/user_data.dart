import 'package:equatable/equatable.dart';

class UserDataEntitie extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  const UserDataEntitie({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [userId, firstName, lastName, email, imageUrl];
}
