import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utl/utls.dart';
import '../../domain/usecases/get_all_forums.dart';

part 'forms_event.dart';
part 'forums_state.dart';

class ForumsBloc extends Bloc<FormsEvent, ForumsState> {
  ForumsBloc(this.allForumsUsecase) : super(const ForumsState()) {
    on<AllForumsEvent>(_getAllForums);
  }
  final AllForumsUsecase allForumsUsecase;
  FutureOr<void> _getAllForums(
      AllForumsEvent event, Emitter<ForumsState> emit) async {
    final result =
        await allForumsUsecase(AllForumsParams(accessToken: event.accessToken));
    result.fold(
      (l) => emit(state.copyWith(
          errorMessage: l.message,
          forumsRequestState: ForumsRequestState.error)),
      (r) => emit(
        state.copyWith(
            allForumsEntitie: r, forumsRequestState: ForumsRequestState.loaded),
      ),
    );
  }
}
