part of 'forums_bloc.dart';

class ForumsState extends Equatable {
  final ForumsRequestState forumsRequestState;
  final List<ForumsEntitie> allForumsEntitie;
  final List<ForumsMeEntitie> forumsMeEntitie;
  final String? errorMessage;

  const ForumsState({
    this.forumsRequestState = ForumsRequestState.loading,
    this.allForumsEntitie = const [],
    this.errorMessage = '',
    this.forumsMeEntitie = const [],
  });

  ForumsState copyWith({
    ForumsRequestState? forumsRequestState,
    List<ForumsEntitie>? allForumsEntitie,
    String? errorMessage,
    List<ForumsMeEntitie>? forumsMeEntitie,
  }) {
    return ForumsState(
      forumsRequestState: forumsRequestState ?? this.forumsRequestState,
      allForumsEntitie: allForumsEntitie ?? this.allForumsEntitie,
      errorMessage: errorMessage ?? this.errorMessage,
      forumsMeEntitie: forumsMeEntitie ?? this.forumsMeEntitie,
    );
  }

  @override
  List<Object?> get props => [
        forumsRequestState,
        allForumsEntitie,
        errorMessage,
        forumsMeEntitie,
      ];
}
