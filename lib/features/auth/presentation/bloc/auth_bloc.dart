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
    on<CheckPasswordValidationEvent>(_chackPasswordConfirm);
    on<CheckEmailValidationEvent>(_checkEmailValidation);
    on<CheckPasswordConfirmValidationEvent>(_checkPasswordConfirm);
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
          signUpRequestState: SignUpRequestState.error)),
      (r) => emit(
        state.copyWith(
          authDataEntitie: r,
          signUpRequestState: SignUpRequestState.signUploaded,
        ),
      ),
    );
  }

  FutureOr<void> _cacheAccessToken(
      AccessTokenCacheEvent event, Emitter<AuthBlocState> emit) async {
    emit(state.copyWith(accessTokenCached: false));
    final result = await accessTokenCacheUsecase(
        AccessTokenCacheParams(accessToken: event.accessToken));

    result.fold((l) {
      if (event.isLogin) {
        return emit(state.copyWith(
            authMessage: l.message,
            authState: RequestState.error,
            accessTokenCached: false));
      } else {
        return emit(state.copyWith(
            authMessage: l.message,
            signUpRequestState: SignUpRequestState.error,
            accessTokenCached: false));
      }
    }, (r) {
      //clearAllAuthTextFiledsData();
      savedaccessToken = state.authDataEntitie!.accessToken;
      if (event.isLogin) {
        return emit(
          state.copyWith(
            accessTokenCached: true,
            authState: RequestState.cachedSuccess,
          ),
        );
      } else {
        return emit(state.copyWith(
            accessTokenCached: true,
            signUpRequestState: SignUpRequestState.cachedSuccess));
      }
    });
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

  String? validatePassowrdConfirm(String? confirmPassword, String password) {
    if (confirmPassword == null) {
      add(const CheckPasswordConfirmValidationEvent(false));
      return 'Please enter your password again';
    } else if (confirmPassword != password) {
      add(const CheckPasswordConfirmValidationEvent(false));
      return "Invalid Password";
    } else {
      add(const CheckPasswordConfirmValidationEvent(true));
      return null;
    }
  }

  String? validateEmail({
    String? value,
    required bool isLogin,
  }) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (value == null) {
      add(CheckEmailValidationEvent(isLogin, false));
      return 'Please enter Email';
    } else if (!(regex.hasMatch(value))) {
      add(CheckEmailValidationEvent(isLogin, false));
      return "Invalid Email";
    } else {
      add(CheckEmailValidationEvent(isLogin, true));
      return null;
    }
  }

  String? validatePassword({
    String? value,
    required bool isLogin,
  }) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value == null) {
      add(CheckPasswordValidationEvent(isLogin, false));
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        add(CheckPasswordValidationEvent(isLogin, false));
        return 'should contain one(upper case-lower case - digit) Must be at least 8 characters in length ';
      } else {
        add(CheckPasswordValidationEvent(isLogin, true));
        return null;
      }
    }
  }

  FutureOr<void> _chackPasswordConfirm(
      CheckPasswordValidationEvent event, Emitter<AuthBlocState> emit) {
    if (event.isLogin) {
      if (event.isPasswordValid) {
        emit(state.copyWith(isPasswordLoginVaild: true));
      } else {
        emit(state.copyWith(isPasswordLoginVaild: false));
      }
    } else {
      if (event.isPasswordValid) {
        emit(state.copyWith(isPasswordSignUpVaild: true));
      } else {
        emit(state.copyWith(isPasswordSignUpVaild: false));
      }
    }
  }

  FutureOr<void> _checkEmailValidation(
      CheckEmailValidationEvent event, Emitter<AuthBlocState> emit) {
    if (event.isLogin) {
      if (event.isEmaildValid) {
        emit(state.copyWith(isEmailLoginVaild: true));
      } else {
        emit(state.copyWith(isEmailLoginVaild: false));
      }
    } else {
      if (event.isEmaildValid) {
        emit(state.copyWith(isEmailSignUpVaild: true));
      } else {
        emit(state.copyWith(isEmailSignUpVaild: false));
      }
    }
  }

  FutureOr<void> _checkPasswordConfirm(
      CheckPasswordConfirmValidationEvent event, Emitter<AuthBlocState> emit) {
    emit(state.copyWith(
        isPasswordConfirmSignUpVaild: event.isConfirmPasswordValid));
  }
}
