part of 'main_layout_bloc.dart';

abstract class MainLayoutEvent extends Equatable {
  const MainLayoutEvent();
}

class ActiveScreenIndexEvent extends MainLayoutEvent {
  final int currentBottomNavIndex;

  const ActiveScreenIndexEvent(this.currentBottomNavIndex);

  @override
  List<Object?> get props => [currentBottomNavIndex];
}

class GetUserDataEvent extends MainLayoutEvent {
  final String accessToken;

  const GetUserDataEvent(this.accessToken);
  @override
  List<Object?> get props => [accessToken];
}

class GetAccessTokenFromCacheEvent extends MainLayoutEvent {
  final String key;

  const GetAccessTokenFromCacheEvent(this.key);

  @override
  List<Object?> get props => [key];
}

class BackToinitialEvent extends MainLayoutEvent {
  @override
  List<Object?> get props => [];
}
