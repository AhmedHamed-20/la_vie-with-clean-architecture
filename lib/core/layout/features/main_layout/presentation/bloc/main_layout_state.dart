part of 'main_layout_bloc.dart';

class MainLayoutState extends Equatable {
  final UserDataRequestState userDataRequestState;
  final String accessToken;
  final int currentBottomNavIndex;
  final UserDataEntitie? userDataEntitie;
  final int? statusCode;
  final String mainLayoutErrorMessage;
  const MainLayoutState({
    this.accessToken = '',
    this.mainLayoutErrorMessage = '',
    this.userDataRequestState = UserDataRequestState.loading,
    this.userDataEntitie,
    this.currentBottomNavIndex = 2,
    this.statusCode,
  });

  MainLayoutState copyWith({
    String? accessToken,
    String? mainLayoutErrorMessage,
    int? statusCode,
    UserDataRequestState? userDataRequestState,
    UserDataEntitie? userDataEntitie,
    int? currentBottomNavIndex,
  }) {
    return MainLayoutState(
        accessToken: accessToken ?? this.accessToken,
        mainLayoutErrorMessage:
            mainLayoutErrorMessage ?? this.mainLayoutErrorMessage,
        statusCode: statusCode ?? this.statusCode,
        userDataRequestState: userDataRequestState ?? this.userDataRequestState,
        userDataEntitie: userDataEntitie ?? this.userDataEntitie,
        currentBottomNavIndex:
            currentBottomNavIndex ?? this.currentBottomNavIndex);
  }

  @override
  List<Object?> get props => [
        mainLayoutErrorMessage,
        statusCode,
        userDataEntitie,
        currentBottomNavIndex,
        userDataRequestState,
        accessToken,
      ];
}
