part of 'auth_bloc.dart';

class AuthBlocState extends Equatable {
  final bool signUpObscureText;
  final bool loginObscureText;

  final int currentActiveTab;
  final AuthDataEntitie? authDataEntitie;
  final SignUpRequestState signUpRequestState;
  final RequestState authState;
  final String authMessage;
  final bool accessTokenCached;
  const AuthBlocState({
    this.signUpRequestState = SignUpRequestState.idle,
    this.loginObscureText = true,
    this.signUpObscureText = true,
    this.currentActiveTab = 1,
    this.authDataEntitie,
    this.authState = RequestState.idle,
    this.authMessage = '',
    this.accessTokenCached = false,
  });

  AuthBlocState copyWith({
    SignUpRequestState? signUpRequestState,
    bool? loginObscureText,
    bool? signUpObscureText,
    int? currentActiveTab,
    AuthDataEntitie? authDataEntitie,
    RequestState? authState,
    String? authMessage,
    bool? accessTokenCached,
  }) {
    return AuthBlocState(
      signUpRequestState: signUpRequestState ?? this.signUpRequestState,
      loginObscureText: loginObscureText ?? this.loginObscureText,
      signUpObscureText: signUpObscureText ?? this.signUpObscureText,
      currentActiveTab: currentActiveTab ?? this.currentActiveTab,
      authDataEntitie: authDataEntitie ?? this.authDataEntitie,
      authState: authState ?? this.authState,
      authMessage: authMessage ?? this.authMessage,
      accessTokenCached: accessTokenCached ?? this.accessTokenCached,
    );
  }

  @override
  List<Object?> get props => [
        loginObscureText,
        signUpObscureText,
        authDataEntitie,
        authState,
        authMessage,
        accessTokenCached,
        currentActiveTab,
        signUpRequestState
      ];
}
