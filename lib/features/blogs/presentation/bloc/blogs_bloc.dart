import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utl/utls.dart';
import '../../domain/entities/blogs_entitie.dart';
import '../../domain/usecases/get_blogs_usecase.dart';

part 'blogs_event.dart';
part 'blogs_state.dart';

class BlogsBloc extends Bloc<BaseBlogsEvent, BlogsState> {
  BlogsBloc(this.blogsUsecase) : super(const BlogsState()) {
    on<AllBlogsEvent>(_getBlogs);
    on<TobTabsIndex>(_changeCurrentActiveTab);
  }
  final BlogsUsecase blogsUsecase;

  FutureOr<void> _getBlogs(
      AllBlogsEvent event, Emitter<BlogsState> emit) async {
    final result = await blogsUsecase(BlogsParams(event.accessToken));
    result.fold(
      (l) => emit(state.copyWith(
          errorMessage: l.message, blogsRequestState: BlogsRequestState.error)),
      (r) => emit(
        state.copyWith(
          blogsEntitie: r,
          blogsRequestState: BlogsRequestState.loaded,
          activeEntitie: r.plantEntitie,
        ),
      ),
    );
  }

  FutureOr<void> _changeCurrentActiveTab(
      TobTabsIndex event, Emitter<BlogsState> emit) {
    switch (event.currentActiveTab) {
      case 0:
        emit(state.copyWith(
            currentActiveTab: event.currentActiveTab,
            activeEntitie: state.blogsEntitie?.plantEntitie));
        break;
      case 1:
        emit(state.copyWith(
            currentActiveTab: event.currentActiveTab,
            activeEntitie: state.blogsEntitie?.seedsEntitie));
        break;
      case 2:
        emit(state.copyWith(
            currentActiveTab: event.currentActiveTab,
            activeEntitie: state.blogsEntitie?.toolEntitie));
        break;
      default:
        emit(state.copyWith(
            currentActiveTab: event.currentActiveTab,
            activeEntitie: state.blogsEntitie?.plantEntitie));
        break;
    }
  }
}
