import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utl/utls.dart';
import '../../../domain/entities/auth_entitie.dart';
import '../../../domain/entities/user_data.dart';
import '../../../domain/usecases/get_userdata_usecase.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/signUp_usecase.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc(this.loginUsecase, this.signupUscase, this.userDataUsecase)
      : super(const AuthBlocState()) {
    on<LoginEvent>(_login);
    on<SignupEvent>(_signUp);
    on<GetUserDataEvent>(_getUserData);
  }

  LoginUsecase loginUsecase;
  SignupUscase signupUscase;
  UserDataUsecase userDataUsecase;
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

  FutureOr<void> _getUserData(
      GetUserDataEvent event, Emitter<AuthBlocState> emit) async {
    final result = await userDataUsecase(
      UserDataParams(accessToken: event.accessToken),
    );
    emit(state.copyWith(authState: RequestState.userdataloading));
    result.fold(
        (l) => emit(state.copyWith(
            authState: RequestState.error, authMessage: l.message)),
        (r) => emit(state.copyWith(
            userDataEntitie: r, authState: RequestState.userdataloaded)));
  }
}
