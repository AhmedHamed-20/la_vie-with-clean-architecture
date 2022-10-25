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
  final String passwordConfirm;
  const SignupEvent(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.passwordConfirm});

  @override
  List<Object?> get props =>
      [email, password, firstName, lastName, passwordConfirm];
}

class AccessTokenCacheEvent extends AuthBlocEvent {
  final String accessToken;

  const AccessTokenCacheEvent(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}

class CurrentActiveTabIndexEvent extends AuthBlocEvent {
  final int currentActiveTab;

  const CurrentActiveTabIndexEvent(this.currentActiveTab);

  @override
  List<Object?> get props => [currentActiveTab];
}

class LoginObscureTextEvent extends AuthBlocEvent {
  final bool loginObscureText;

  const LoginObscureTextEvent(this.loginObscureText);

  @override
  List<Object?> get props => [loginObscureText];
}

class SignUpObscureTextEvent extends AuthBlocEvent {
  final bool signUoObscureText;

  const SignUpObscureTextEvent(this.signUoObscureText);

  @override
  List<Object?> get props => [signUoObscureText];
}
