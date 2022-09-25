part of 'auth_bloc_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class LoginEvent extends LoginBlocEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignupEvent extends LoginBlocEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  const SignupEvent(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  @override
  List<Object?> get props => [email, password, firstName, lastName];
}
