part of 'auth_bloc_bloc.dart';

class AuthBlocState extends Equatable {
  final AuthDataEntitie? authDataEntitie;
  final UserDataEntitie? userDataEntitie;
  final RequestState authState;
  final String authMessage;
  const AuthBlocState({
    this.authDataEntitie,
    this.authState = RequestState.idle,
    this.authMessage = '',
    this.userDataEntitie,
  });

  AuthBlocState copyWith({
    AuthDataEntitie? authDataEntitie,
    RequestState? authState,
    String? authMessage,
    UserDataEntitie? userDataEntitie,
  }) {
    return AuthBlocState(
      authDataEntitie: authDataEntitie ?? this.authDataEntitie,
      authState: authState ?? this.authState,
      authMessage: authMessage ?? this.authMessage,
      userDataEntitie: userDataEntitie ?? this.userDataEntitie,
    );
  }

  @override
  List<Object?> get props => [
        authDataEntitie,
        userDataEntitie,
        authState,
        authMessage,
      ];
}
