import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/usecases/get_access_token_from_cache.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/usecases/get_userdata_usecase.dart';
import 'package:la_vie_with_clean_architecture/core/utl/utls.dart';
import '../../../../../constants/constants.dart';
import '../../domain/entities/user_data.dart';
part 'main_layout_event.dart';
part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  MainLayoutBloc(this.userDataUsecase, this.accessTokenFromCacheUsecase)
      : super(const MainLayoutState()) {
    on<ActiveScreenIndexEvent>(_changeBottomNavIndex);
    on<GetUserDataEvent>(_getUserData);
    on<GetAccessTokenFromCacheEvent>(_getAccessTokenFromCache);
  }
  UserDataUsecase userDataUsecase;
  AccessTokenFromCacheUsecase accessTokenFromCacheUsecase;
  FutureOr<void> _getAccessTokenFromCache(
      GetAccessTokenFromCacheEvent event, Emitter<MainLayoutState> emit) async {
    emit(state.copyWith(userDataRequestState: UserDataRequestState.loading));
    final result = await accessTokenFromCacheUsecase(
        AccessTokenFromCacheParams(event.key));

    result.fold(
        (l) => emit(state.copyWith(
            userDataRequestState: UserDataRequestState.error,
            mainLayoutErrorMessage: l.message)), (r) {
      accessToken = r;

      return emit(
        state.copyWith(
          accessToken: r,
          userDataRequestState: UserDataRequestState.accessTokenGetSuccess,
        ),
      );
    });
  }

  FutureOr<void> _getUserData(
      GetUserDataEvent event, Emitter<MainLayoutState> emit) async {
    final result = await userDataUsecase(
      UserDataParams(accessToken: event.accessToken),
    );
    result.fold(
        (l) => emit(state.copyWith(
            userDataRequestState: UserDataRequestState.error,
            statusCode: l.statusCode,
            mainLayoutErrorMessage: l.message)), (r) {
      userId = r.userId;
      return emit(
        state.copyWith(
          userDataEntitie: r,
          userDataRequestState: UserDataRequestState.loaded,
        ),
      );
    });
  }

  FutureOr<void> _changeBottomNavIndex(
      ActiveScreenIndexEvent event, Emitter<MainLayoutState> emit) {
    emit(
      state.copyWith(
        currentBottomNavIndex: event.currentBottomNavIndex,
      ),
    );
  }
}
