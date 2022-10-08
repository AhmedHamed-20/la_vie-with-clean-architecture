part of 'user_info_bloc.dart';

class UpdatedUserDataState extends Equatable {
  final UpdatedUserDataEntitie? updatedUserDataEntitie;
  final String updatedUserDataErrorMessage;
  final UpdateUserDataRequestState updateUserDataRequestState;

  const UpdatedUserDataState(
      {this.updatedUserDataEntitie,
      this.updatedUserDataErrorMessage = '',
      this.updateUserDataRequestState = UpdateUserDataRequestState.idle});

  UpdatedUserDataState copyWith({
    UpdatedUserDataEntitie? updatedUserDataEntitie,
    UpdateUserDataRequestState? updateUserDataRequestState,
    String? updatedUserDataErrorMessage,
  }) {
    return UpdatedUserDataState(
        updateUserDataRequestState:
            updateUserDataRequestState ?? this.updateUserDataRequestState,
        updatedUserDataEntitie:
            updatedUserDataEntitie ?? this.updatedUserDataEntitie,
        updatedUserDataErrorMessage:
            updatedUserDataErrorMessage ?? this.updatedUserDataErrorMessage);
  }

  @override
  List<Object?> get props => [
        updateUserDataRequestState,
        updatedUserDataErrorMessage,
        updatedUserDataEntitie,
      ];
}
