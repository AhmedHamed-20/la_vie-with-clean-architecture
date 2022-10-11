part of 'auth_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();
}

class LoginEvent extends AuthBlocEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignupEvent extends AuthBlocEvent {
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

class AccessTokenCacheEvent extends AuthBlocEvent {
  final String accessToken;

  const AccessTokenCacheEvent(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}
