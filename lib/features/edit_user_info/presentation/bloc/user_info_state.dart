part of 'user_info_bloc.dart';

class UserInfoState extends Equatable {
  final UpdatedUserDataEntitie? updatedUserDataEntitie;
  final String updatedUserDataErrorMessage;
  final UpdateUserDataRequestState updateUserDataRequestState;

  const UserInfoState(
      {this.updatedUserDataEntitie,
      this.updatedUserDataErrorMessage = '',
      this.updateUserDataRequestState = UpdateUserDataRequestState.idle});

  UserInfoState copyWith({
    UpdatedUserDataEntitie? updatedUserDataEntitie,
    UpdateUserDataRequestState? updateUserDataRequestState,
    String? updatedUserDataErrorMessage,
  }) {
    return UserInfoState(
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
