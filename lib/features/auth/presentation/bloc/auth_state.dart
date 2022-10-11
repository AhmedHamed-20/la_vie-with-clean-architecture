part of 'auth_bloc.dart';

class AuthBlocState extends Equatable {
  final AuthDataEntitie? authDataEntitie;
  final RequestState authState;
  final String authMessage;
  final bool accessTokenCached;
  const AuthBlocState({
    this.authDataEntitie,
    this.authState = RequestState.idle,
    this.authMessage = '',
    this.accessTokenCached = false,
  });

  AuthBlocState copyWith({
    AuthDataEntitie? authDataEntitie,
    RequestState? authState,
    String? authMessage,
    bool? accessTokenCached,
  }) {
    return AuthBlocState(
      authDataEntitie: authDataEntitie ?? this.authDataEntitie,
      authState: authState ?? this.authState,
      authMessage: authMessage ?? this.authMessage,
      accessTokenCached: accessTokenCached ?? this.accessTokenCached,
    );
  }

  @override
  List<Object?> get props => [
        authDataEntitie,
        authState,
        authMessage,
        accessTokenCached,
      ];
}
