import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utl/utls.dart';
import '../../bloc/forums_bloc.dart';
import 'add_photo_widget.dart';

class AddPhotoWidgetStates extends StatelessWidget {
  const AddPhotoWidgetStates({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsBloc, ForumsState>(
      listener: (context, state) {
        if (state.imagePickeRequestState.name == 'error') {
          flutterToast(
              msg: 'please select an image',
              backgroundColor: AppColors.toastError,
              textColor: AppColors.white);
        }
      },
      builder: (context, state) {
        switch (state.imagePickeRequestState) {
          case ImagePickeRequestState.loading:
            return GestureDetector(
              onTap: () {
                context.read<ForumsBloc>().add(PickImageEvent());
              },
              child: const AddPhotoWidget(),
            );

          case ImagePickeRequestState.picked:
            return GestureDetector(
              onTap: () {
                context.read<ForumsBloc>().add(PickImageEvent());
              },
              child: state.forumsPostRequestState.name == 'posted'
                  ? const AddPhotoWidget()
                  : Center(
                      child: Image.file(
                        state.photoPath!,
                        width: AppWidth.w100,
                        height: AppHeight.h100,
                        fit: BoxFit.contain,
                      ),
                    ),
            );
          case ImagePickeRequestState.error:
            return GestureDetector(
                onTap: () {
                  context.read<ForumsBloc>().add(PickImageEvent());
                },
                child: const AddPhotoWidget());
        }
      },
    );
  }
}
