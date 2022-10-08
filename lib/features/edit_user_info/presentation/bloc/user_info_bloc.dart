import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/utl/utls.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/entities/updated_user_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/usecases/update_user_data.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UpdatedUserDataState> {
  UserInfoBloc(this.updateUserDataUsecasel)
      : super(const UpdatedUserDataState()) {
    on<UpdatedUserDataEvent>(_updateUserData);
  }
  UpdateUserDataUsecase updateUserDataUsecasel;

  FutureOr<void> _updateUserData(
      UpdatedUserDataEvent event, Emitter<UpdatedUserDataState> emit) async {
    emit(
      state.copyWith(
        updateUserDataRequestState: UpdateUserDataRequestState.loading,
      ),
    );
    final result = await updateUserDataUsecasel(
      UpdatedUserDataParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        address: event.address,
        accessToken: event.accessToken,
      ),
    );
    result.fold(
      (l) => emit(state.copyWith(
          updatedUserDataErrorMessage: l.message,
          updateUserDataRequestState: UpdateUserDataRequestState.error)),
      (r) => emit(
        state.copyWith(
          updatedUserDataEntitie: r,
          updateUserDataRequestState:
              UpdateUserDataRequestState.updatedSuccessfully,
        ),
      ),
    );
  }
}
