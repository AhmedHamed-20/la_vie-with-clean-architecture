import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/cache_access_token.dart';

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

    on<AccessTokenCacheEvent>(_cacheAccessToken);
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

  FutureOr<void> _signUp(SignupEvent event, Emitter<AuthBlocState> emit) async {
    final result = await signupUscase(
      SignUpParams(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName),
    );
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

  FutureOr<void> _cacheAccessToken(
      AccessTokenCacheEvent event, Emitter<AuthBlocState> emit) async {
    final result = await accessTokenCacheUsecase(
        AccessTokenCacheParams(accessToken: event.accessToken));

    result.fold(
      (l) => emit(state.copyWith(
          authMessage: l.message, authState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          accessTokenCached: r,
          authState: RequestState.cachedSuccess,
        ),
      ),
    );
  }
}
