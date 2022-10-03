part of 'blogs_bloc.dart';

abstract class BaseBlogsEvent extends Equatable {
  const BaseBlogsEvent();
}

class AllBlogsEvent extends BaseBlogsEvent {
  final String accessToken;

  const AllBlogsEvent(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}

class TobTabsIndex extends BaseBlogsEvent {
  final int currentActiveTab;
  const TobTabsIndex(this.currentActiveTab);

  @override
  List<Object?> get props => [currentActiveTab];
}
