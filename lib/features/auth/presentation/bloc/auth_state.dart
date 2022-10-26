part of 'auth_bloc.dart';

class AuthBlocState extends Equatable {
  final bool signUpObscureText;
  final bool loginObscureText;
  final bool isEmailLoginVaild;
  final bool isPasswordLoginVaild;
  final bool isEmailSignUpVaild;
  final bool isPasswordSignUpVaild;

  final bool isPasswordConfirmSignUpVaild;
  final int currentActiveTab;
  final AuthDataEntitie? authDataEntitie;
  final SignUpRequestState signUpRequestState;
  final RequestState authState;
  final String authMessage;
  final bool accessTokenCached;
  const AuthBlocState({
    this.isEmailLoginVaild = false,
    this.isEmailSignUpVaild = false,
    this.isPasswordConfirmSignUpVaild = false,
    this.isPasswordLoginVaild = false,
    this.isPasswordSignUpVaild = false,
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
    bool? isEmailLoginVaild,
    bool? isPasswordLoginVaild,
    bool? isEmailSignUpVaild,
    bool? isPasswordSignUpVaild,
    bool? isPasswordConfirmSignUpVaild,
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
      isEmailLoginVaild: isEmailLoginVaild ?? this.isEmailLoginVaild,
      isPasswordConfirmSignUpVaild:
          isPasswordConfirmSignUpVaild ?? this.isPasswordConfirmSignUpVaild,
      isPasswordLoginVaild: isPasswordLoginVaild ?? this.isPasswordLoginVaild,
      isPasswordSignUpVaild:
          isPasswordSignUpVaild ?? this.isPasswordSignUpVaild,
      isEmailSignUpVaild: isEmailSignUpVaild ?? this.isEmailSignUpVaild,
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
        isEmailLoginVaild,
        isPasswordLoginVaild,
        isEmailSignUpVaild,
        isPasswordSignUpVaild,
        isPasswordConfirmSignUpVaild,
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
