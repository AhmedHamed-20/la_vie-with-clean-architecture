import 'package:equatable/equatable.dart';

class ForumsUserEntitie extends Equatable {
  final String firstName;
  final String lastName;
  final String imageUrl;

  const ForumsUserEntitie(
      {required this.firstName,
      required this.lastName,
      required this.imageUrl});

  @override
  List<Object?> get props => [firstName, lastName, imageUrl];
}
