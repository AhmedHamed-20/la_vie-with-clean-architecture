part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();
}

class UpdatedUserDataEvent extends UserInfoEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String accessToken;

  const UpdatedUserDataEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.accessToken});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        address,
        accessToken,
      ];
}
