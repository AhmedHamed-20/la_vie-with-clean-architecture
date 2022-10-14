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
