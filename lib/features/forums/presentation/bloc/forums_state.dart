part of 'forums_bloc.dart';

class ForumsState extends Equatable {
  final ForumsRequestState forumsRequestState;
  final List<ForumsEntitie> allForumsEntitie;
  final String? errorMessage;

  const ForumsState({
    this.forumsRequestState = ForumsRequestState.loading,
    this.allForumsEntitie = const [],
    this.errorMessage = '',
  });

  ForumsState copyWith({
    ForumsRequestState? forumsRequestState,
    List<ForumsEntitie>? allForumsEntitie,
    String? errorMessage,
  }) {
    return ForumsState(
      forumsRequestState: forumsRequestState ?? this.forumsRequestState,
      allForumsEntitie: allForumsEntitie ?? this.allForumsEntitie,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        forumsRequestState,
        allForumsEntitie,
        errorMessage,
      ];
}
