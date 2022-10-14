import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_layout_event.dart';
part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  MainLayoutBloc() : super(const MainLayoutState()) {
    on<ActiveScreenIndexEvent>(_changeBottomNavIndex);
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
