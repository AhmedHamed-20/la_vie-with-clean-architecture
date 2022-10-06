part of 'forums_bloc.dart';

class ForumsState extends Equatable {
  final ImagePickeRequestState imagePickeRequestState;
  final ForumsRequestState forumsRequestState;
  final ForumsPostRequestState forumsPostRequestState;
  final List<ForumsEntitie> allForumsEntitie;
  final List<ForumsMeEntitie> forumsMeEntitie;
  final String? errorMessage;
  final String? convertedImageToBase64;

  const ForumsState({
    this.forumsPostRequestState = ForumsPostRequestState.idle,
    this.forumsRequestState = ForumsRequestState.loading,
    this.allForumsEntitie = const [],
    this.errorMessage = '',
    this.forumsMeEntitie = const [],
    this.convertedImageToBase64 = '',
    this.imagePickeRequestState = ImagePickeRequestState.loading,
  });

  ForumsState copyWith({
    ForumsPostRequestState? forumsPostRequestState,
    ForumsRequestState? forumsRequestState,
    List<ForumsEntitie>? allForumsEntitie,
    String? errorMessage,
    List<ForumsMeEntitie>? forumsMeEntitie,
    String? convertedImageToBase64,
    ImagePickeRequestState? imagePickeRequestState,
  }) {
    return ForumsState(
      forumsRequestState: forumsRequestState ?? this.forumsRequestState,
      allForumsEntitie: allForumsEntitie ?? this.allForumsEntitie,
      errorMessage: errorMessage ?? this.errorMessage,
      forumsMeEntitie: forumsMeEntitie ?? this.forumsMeEntitie,
      forumsPostRequestState:
          forumsPostRequestState ?? this.forumsPostRequestState,
      convertedImageToBase64:
          convertedImageToBase64 ?? this.convertedImageToBase64,
      imagePickeRequestState:
          imagePickeRequestState ?? this.imagePickeRequestState,
    );
  }

  @override
  List<Object?> get props => [
        forumsRequestState,
        allForumsEntitie,
        errorMessage,
        forumsMeEntitie,
        forumsPostRequestState,
        convertedImageToBase64,
        imagePickeRequestState,
      ];
}
