import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

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
      this.allForumsUsecase, this.forumsMeUsecase, this.forumsPostUsecase)
      : super(const ForumsState()) {
    on<AllForumsEvent>(_getAllForums);
    on<ForumsMeEvent>(_getForumsMe);
    on<ForumsPostEvent>(_postNewForum);
    on<PickImageEvent>(_pickImageAndConvertItToBase64);
    on<ActiveTabForumsEvent>(_changeActiveTabIndex);
  }
  final AllForumsUsecase allForumsUsecase;
  final ForumsMeUsecase forumsMeUsecase;
  final ForumsPostUscase forumsPostUsecase;
  FutureOr<void> _getAllForums(
      AllForumsEvent event, Emitter<ForumsState> emit) async {
    emit(state.copyWith(forumsRequestState: ForumsRequestState.loading));

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
    emit(state.copyWith(forumsRequestState: ForumsRequestState.loading));
    final result =
        await forumsMeUsecase(ForumsMeParams(accessToken: event.accessToken));
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
      final image = await convertImageToBase64(result);
      emit(
        state.copyWith(
          convertedImageToBase64: image,
          imagePickeRequestState: ImagePickeRequestState.picked,
        ),
      );
    } else {
      // User canceled the picker
      emit(
          state.copyWith(imagePickeRequestState: ImagePickeRequestState.error));
    }
  }

  FutureOr<void> _changeActiveTabIndex(
      ActiveTabForumsEvent event, Emitter<ForumsState> emit) {
    switch (event.currentActiveTabe) {
      case 0:
        emit(state.copyWith(
            currentActiveIndex: 0, activeEtitie: state.allForumsEntitie));
        break;
      case 1:
        emit(state.copyWith(
            currentActiveIndex: 1, activeEtitie: state.forumsMeEntitie));
        break;
      default:
        emit(state.copyWith(
            currentActiveIndex: 0, activeEtitie: state.allForumsEntitie));
        break;
    }
  }
}
