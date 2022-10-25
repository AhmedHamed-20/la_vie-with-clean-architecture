import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/text_fileds_controlers/textfiled_controlers.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/cache_access_token.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utl/utls.dart';
import '../../domain/entities/auth_entitie.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signUp_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc(this.loginUsecase, this.signupUscase, this.accessTokenCacheUsecase)
      : super(const AuthBlocState()) {
    on<LoginEvent>(_login);
    on<SignupEvent>(_signUp);
    on<CurrentActiveTabIndexEvent>(_changeCurrentActiveTab);
    on<AccessTokenCacheEvent>(_cacheAccessToken);
    on<SignUpObscureTextEvent>(_signUpObscureText);
    on<LoginObscureTextEvent>(_loginObscureText);
  }

  LoginUsecase loginUsecase;
  SignupUscase signupUscase;
  AccessTokenCacheUsecase accessTokenCacheUsecase;
  FutureOr<void> _login(LoginEvent event, Emitter<AuthBlocState> emit) async {
    final result = await loginUsecase(
        LoginParams(email: event.email, password: event.password));
    emit(state.copyWith(authState: RequestState.loading));

    result.fold(
      (l) => emit(state.copyWith(
          authMessage: l.message, authState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          authDataEntitie: r,
          authState: RequestState.loginloaded,
        ),
      ),
    );
  }

  void clearAllAuthTextFiledsData() {
    TextFormFieldControllers.emailSignUpController.clear();
    TextFormFieldControllers.emailLoginController.clear();
    TextFormFieldControllers.lastNameSignUpController.clear();
    TextFormFieldControllers.firstNameSignUpController.clear();
    TextFormFieldControllers.passwordConfirmSignUpController.clear();
    TextFormFieldControllers.passwordLoginController.clear();
    TextFormFieldControllers.passwordSignUpController.clear();
  }

  FutureOr<void> _signUp(SignupEvent event, Emitter<AuthBlocState> emit) async {
    final result = await signupUscase(
      SignUpParams(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName),
    );
    emit(state.copyWith(signUpRequestState: SignUpRequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
            authMessage: l.message,
            signUpRequestState: SignUpRequestState.error)), (r) {
      return emit(
        state.copyWith(
          authDataEntitie: r,
          signUpRequestState: SignUpRequestState.signUploaded,
        ),
      );
    });
  }

  FutureOr<void> _cacheAccessToken(
      AccessTokenCacheEvent event, Emitter<AuthBlocState> emit) async {
    final result = await accessTokenCacheUsecase(
        AccessTokenCacheParams(accessToken: event.accessToken));

    result.fold(
        (l) => emit(state.copyWith(
            authMessage: l.message, authState: RequestState.error)), (r) {
      clearAllAuthTextFiledsData();
      savedaccessToken = state.authDataEntitie!.accessToken;

      return emit(
        state.copyWith(
          accessTokenCached: r,
          authState: RequestState.cachedSuccess,
        ),
      );
    });
    state.copyWith(accessTokenCached: false);
  }

  FutureOr<void> _changeCurrentActiveTab(
      CurrentActiveTabIndexEvent event, Emitter<AuthBlocState> emit) {
    emit(state.copyWith(currentActiveTab: event.currentActiveTab));
  }

  FutureOr<void> _signUpObscureText(
      SignUpObscureTextEvent event, Emitter<AuthBlocState> emit) {
    emit(state.copyWith(signUpObscureText: event.signUoObscureText));
  }

  FutureOr<void> _loginObscureText(
      LoginObscureTextEvent event, Emitter<AuthBlocState> emit) {
    emit(state.copyWith(loginObscureText: event.loginObscureText));
  }
}
