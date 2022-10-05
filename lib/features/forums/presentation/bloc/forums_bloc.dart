import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utl/utls.dart';
import '../../domain/entities/forums_entitie.dart';
import '../../domain/entities/forums_me_entitie.dart';

import '../../domain/usecases/get_all_forums.dart';
import '../../domain/usecases/get_forums_me.dart';

part 'forms_event.dart';
part 'forums_state.dart';

class ForumsBloc extends Bloc<FormsEvent, ForumsState> {
  ForumsBloc(this.allForumsUsecase, this.forumsMeUsecase)
      : super(const ForumsState()) {
    on<AllForumsEvent>(_getAllForums);
    on<ForumsMeEvent>(_getForumsMe);
  }
  final AllForumsUsecase allForumsUsecase;
  final ForumsMeUsecase forumsMeUsecase;
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

  FutureOr<void> _getForumsMe(
      ForumsMeEvent event, Emitter<ForumsState> emit) async {
    final result =
        await forumsMeUsecase(ForumsMeParams(accessToken: event.accessToken));
    emit(state.copyWith(forumsRequestState: ForumsRequestState.loading));
    result.fold(
      (l) => state.copyWith(
          errorMessage: l.message,
          forumsRequestState: ForumsRequestState.error),
      (r) => emit(
        state.copyWith(
          forumsMeEntitie: r,
          forumsRequestState: ForumsRequestState.loaded,
        ),
      ),
    );
  }
}
