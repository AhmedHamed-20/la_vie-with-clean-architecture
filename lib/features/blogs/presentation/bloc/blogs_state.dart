part of 'blogs_bloc.dart';

class BlogsState extends Equatable {
  final BlogsRequestState blogsRequestState;
  final BLogsEntitie? blogsEntitie;
  final String errorMessage;
  final int currentActiveTab;
  final List<dynamic>? activeEntitie;

  const BlogsState({
    this.blogsRequestState = BlogsRequestState.loading,
    this.blogsEntitie,
    this.errorMessage = '',
    this.currentActiveTab = 0,
    this.activeEntitie,
  });

  BlogsState copyWith(
      {BlogsRequestState? blogsRequestState,
      BLogsEntitie? blogsEntitie,
      String? errorMessage,
      int? currentActiveTab,
      List<dynamic>? activeEntitie}) {
    return BlogsState(
      blogsEntitie: blogsEntitie ?? this.blogsEntitie,
      errorMessage: errorMessage ?? this.errorMessage,
      blogsRequestState: blogsRequestState ?? this.blogsRequestState,
      currentActiveTab: currentActiveTab ?? this.currentActiveTab,
      activeEntitie: activeEntitie ?? this.activeEntitie,
    );
  }

  @override
  List<Object?> get props => [
        blogsEntitie,
        blogsRequestState,
        errorMessage,
        currentActiveTab,
        activeEntitie,
      ];
}
