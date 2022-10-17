part of 'forums_bloc.dart';

class ForumsState extends Equatable {
  final ImagePickeRequestState imagePickeRequestState;
  final ForumsRequestState forumsRequestState;
  final ForumsPostRequestState forumsPostRequestState;
  final List<ForumsEntitie> allForumsEntitie;
  final List<ForumsMeEntitie> forumsMeEntitie;
  final String? errorMessage;
  final String? convertedImageToBase64;
  final List activeEtitie;
  final int currentActiveIndex;
  final File? photoPath;
  const ForumsState({
    this.photoPath,
    this.currentActiveIndex = 0,
    this.activeEtitie = const [],
    this.forumsPostRequestState = ForumsPostRequestState.idle,
    this.forumsRequestState = ForumsRequestState.loading,
    this.allForumsEntitie = const [],
    this.errorMessage = '',
    this.forumsMeEntitie = const [],
    this.convertedImageToBase64 = '',
    this.imagePickeRequestState = ImagePickeRequestState.loading,
  });

  ForumsState copyWith({
    int? currentActiveIndex,
    List? activeEtitie,
    ForumsPostRequestState? forumsPostRequestState,
    ForumsRequestState? forumsRequestState,
    List<ForumsEntitie>? allForumsEntitie,
    String? errorMessage,
    List<ForumsMeEntitie>? forumsMeEntitie,
    String? convertedImageToBase64,
    ImagePickeRequestState? imagePickeRequestState,
    File? photoPath,
  }) {
    return ForumsState(
      photoPath: photoPath ?? this.photoPath,
      currentActiveIndex: currentActiveIndex ?? this.currentActiveIndex,
      activeEtitie: activeEtitie ?? this.activeEtitie,
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
        photoPath,
        forumsRequestState,
        allForumsEntitie,
        errorMessage,
        forumsMeEntitie,
        forumsPostRequestState,
        convertedImageToBase64,
        imagePickeRequestState,
        currentActiveIndex,
        activeEtitie,
      ];
}
