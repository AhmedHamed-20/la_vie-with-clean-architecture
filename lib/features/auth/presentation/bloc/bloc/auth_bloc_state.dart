part of 'auth_bloc_bloc.dart';

class AuthBlocState extends Equatable {
  final AuthDataEntitie? authDataEntitie;
  final RequestState authState;
  final String authMessage;
  const AuthBlocState(
      {this.authDataEntitie,
      this.authState = RequestState.idle,
      this.authMessage = ''});

  AuthBlocState copyWith({
    AuthDataEntitie? authDataEntitie,
    RequestState? authState,
    String? authMessage,
  }) {
    return AuthBlocState(
        authDataEntitie: authDataEntitie ?? this.authDataEntitie,
        authState: authState ?? this.authState,
        authMessage: authMessage ?? this.authMessage);
  }

  @override
  List<Object?> get props => [
        authDataEntitie,
        authState,
        authMessage,
      ];
}
