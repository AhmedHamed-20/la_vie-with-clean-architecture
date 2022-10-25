import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/core/text_fileds_controlers/textfiled_controlers.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_comment_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_like.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/search_in_forums_by_name.dart';
import '../../../../core/utl/utls.dart';
import '../../domain/entities/forums_entitie.dart';
import '../../domain/entities/forums_me_entitie.dart';
import '../../domain/usecases/get_all_forums.dart';
import '../../domain/usecases/get_forums_me.dart';
import '../../domain/usecases/post_new_forums.dart';

part 'forms_event.dart';
part 'forums_state.dart';

class ForumsBloc extends Bloc<ForumsEvent, ForumsState> {
  ForumsBloc(
      this.allForumsUsecase,
      this.forumsMeUsecase,
      this.forumsPostUsecase,
      this.likeAddUsecase,
      this.commentsAddingUsecase,
      this.forumsSearchByTitleUsecase)
      : super(const ForumsState()) {
    on<AllForumsEvent>(_getAllForums);
    on<ForumsMeEvent>(_getForumsMeAndStoreIsLiked);
    on<ForumsPostEvent>(_postNewForum);
    on<PickImageEvent>(_pickImageAndConvertItToBase64);
    on<ActiveTabForumsEvent>(_changeActiveTabIndex);
    on<LikesAddEvent>(_addLikeToPost);
    on<AddCommentEvent>(_addComment);
    on<ForumsSearchEvent>(_searchForumByTitle);
  }
  final AllForumsUsecase allForumsUsecase;
  final ForumsMeUsecase forumsMeUsecase;
  final ForumsPostUscase forumsPostUsecase;
  final LikeAddUsecase likeAddUsecase;
  final CommentsAddingUsecase commentsAddingUsecase;
  final ForumsSearchByTitleUsecase forumsSearchByTitleUsecase;
  FutureOr<void> _getAllForums(
      AllForumsEvent event, Emitter<ForumsState> emit) async {
    final result =
        await allForumsUsecase(AllForumsParams(accessToken: event.accessToken));
    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message,
            forumsRequestState: ForumsRequestState.error)), (r) {
      final List<bool> isLiked = getIslikedList(r, event.userId);
      // print(isLiked);

      return emit(
        state.copyWith(
          allForumsEntitie: r,
          forumsRequestState: ForumsRequestState.loaded,
          isLikedAllForums: isLiked,
        ),
      );
    });
  }

  FutureOr<void> _getForumsMeAndStoreIsLiked(
      ForumsMeEvent event, Emitter<ForumsState> emit) async {
    final result = await forumsMeUsecase(ForumsMeParams(
      accessToken: event.accessToken,
    ));
    result.fold(
        (l) => state.copyWith(
            errorMessage: l.message,
            forumsRequestState: ForumsRequestState.error), (r) {
      final List<bool> isLiked = getIslikedList(r, event.userId);
      // print(isLiked);
      return emit(
        state.copyWith(
          forumsMeEntitie: r,
          forumsRequestState: ForumsRequestState.loaded,
          isLikedMeForums: isLiked,
        ),
      );
    });
  }

  List<bool> getIslikedList(List forums, String userId) {
    List<bool> isLiked = List.filled(forums.length, false);
    for (int i = 0; i < forums.length; i++) {
      for (int j = 0; j < forums[i].forumsLikesEntitie.length; j++) {
        if (forums[i].forumsLikesEntitie[j].userId == userId) {
          isLiked[i] = true;
        }
      }
    }
    return isLiked;
  }

  FutureOr<void> _postNewForum(
      ForumsPostEvent event, Emitter<ForumsState> emit) async {
    emit(
        state.copyWith(forumsPostRequestState: ForumsPostRequestState.loading));
    final result = await forumsPostUsecase(
      ForumsPostParams(
        title: event.title,
        description: event.description,
        imageBae64: event.imageBae64,
        accessToken: event.accessToken,
      ),
    );
    result.fold(
      (l) => emit(state.copyWith(
          errorMessage: l.message,
          forumsPostRequestState: ForumsPostRequestState.error)),
      (r) => emit(
        state.copyWith(
          forumsPostRequestState: ForumsPostRequestState.posted,
        ),
      ),
    );
  }

  Future<String> convertImageToBase64(FilePickerResult result) async {
    final filePath = io.File(result.files.single.path.toString());
    final bytes = await io.File(filePath.path).readAsBytes();
    String finalImageBase64 = "data:image/png;base64,${base64Encode(bytes)}";
    return finalImageBase64;
  }

  FutureOr<void> _pickImageAndConvertItToBase64(
      PickImageEvent event, Emitter<ForumsState> emit) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      final filePath = io.File(result.files.single.path.toString());
      emit(state.copyWith(photoPath: filePath));
      final image = await convertImageToBase64(result);
      emit(
        state.copyWith(
          convertedImageToBase64: image,
          imagePickeRequestState: ImagePickeRequestState.picked,
        ),
      );
    } else {
      emit(
          state.copyWith(imagePickeRequestState: ImagePickeRequestState.error));
    }
  }

  FutureOr<void> _changeActiveTabIndex(
      ActiveTabForumsEvent event, Emitter<ForumsState> emit) {
    switch (event.currentActiveTabe) {
      case 0:
        emit(state.copyWith(
          currentActiveIndex: 0,
        ));
        break;
      case 1:
        emit(state.copyWith(
          currentActiveIndex: 1,
        ));
        break;
      default:
        emit(state.copyWith(
          currentActiveIndex: 0,
        ));
        break;
    }
  }

  FutureOr<void> _addLikeToPost(
      LikesAddEvent event, Emitter<ForumsState> emit) async {
    final result =
        await likeAddUsecase(LikesAddParams(event.forumsId, event.accessToken));
    result.fold((l) => emit(state.copyWith(errorMessage: l.message)), (r) {
      if (state.currentActiveIndex == 0) {
        add(AllForumsEvent(accessToken: savedaccessToken, userId: userId));
      } else if (state.currentActiveIndex == 1) {
        add(ForumsMeEvent(accessToken: savedaccessToken, userId: userId));
      }
    });
  }

  FutureOr<void> _addComment(
      AddCommentEvent event, Emitter<ForumsState> emit) async {
    final result = await commentsAddingUsecase(
        CommentsAddingParams(event.accessToken, event.forumId, event.comment));
    result.fold((l) => emit(state.copyWith(errorMessage: l.message)), (r) {
      if (state.currentActiveIndex == 0) {
        add(AllForumsEvent(accessToken: event.accessToken, userId: userId));
        TextFormFieldControllers.addCommentController.clear();
      } else if (state.currentActiveIndex == 1) {
        add(ForumsMeEvent(accessToken: event.accessToken, userId: userId));
        TextFormFieldControllers.addCommentController.clear();
      }
    });
  }

  FutureOr<void> _searchForumByTitle(
      ForumsSearchEvent event, Emitter<ForumsState> emit) async {
    emit(state.copyWith(
        searchForumRequestState: SearchForumRequestState.loading));
    final result = await forumsSearchByTitleUsecase(
        ForumsSearchByTitleParams(event.accessToken, event.forumsTitle));

    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message,
            searchForumRequestState: SearchForumRequestState.error)),
        (r) => emit(state.copyWith(
            searchForumsEntitie: r,
            searchForumRequestState: SearchForumRequestState.loaded)));
  }
}
