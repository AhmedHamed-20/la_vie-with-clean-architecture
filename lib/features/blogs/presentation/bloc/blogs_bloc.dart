import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/utl/request_state.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/entities/blogs_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/usecases/get_blogs_usecase.dart';

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
        ),
      ),
    );
  }

  FutureOr<void> _changeCurrentActiveTab(
      TobTabsIndex event, Emitter<BlogsState> emit) {
    emit(state.copyWith(currentActiveTab: event.currentActiveTab));
  }
}
