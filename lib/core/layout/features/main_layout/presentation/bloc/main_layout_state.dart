part of 'main_layout_bloc.dart';

class MainLayoutState extends Equatable {
  final int currentBottomNavIndex;

  const MainLayoutState({
    this.currentBottomNavIndex = 2,
  });

  MainLayoutState copyWith({
    int? currentBottomNavIndex,
  }) {
    return MainLayoutState(
        currentBottomNavIndex:
            currentBottomNavIndex ?? this.currentBottomNavIndex);
  }

  @override
  List<Object> get props => [
        currentBottomNavIndex,
      ];
}
