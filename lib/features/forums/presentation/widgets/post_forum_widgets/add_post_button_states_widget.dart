import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../../../../core/utl/utls.dart';
import '../../bloc/forums_bloc.dart';

class AddPostButtonStatesWidget extends StatelessWidget {
  const AddPostButtonStatesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsBloc, ForumsState>(
      listener: (context, state) {
        if (state.forumsPostRequestState.name == 'posted') {
          flutterToast(
              msg: 'Posted Successfuly',
              backgroundColor: AppColors.toastSuccess,
              textColor: AppColors.white);
          context.read<ForumsBloc>().add(
              ForumsMeEvent(accessToken: savedaccessToken, userId: userId));

          TextFormFieldControllers.titlePostController.clear();
          TextFormFieldControllers.descriptionPostController.clear();
        }
      },
      builder: (context, state) {
        switch (state.forumsPostRequestState) {
          case ForumsPostRequestState.idle:
            return defaultButton(
              onPressed: () {
                context.read<ForumsBloc>().add(ForumsPostEvent(
                    accessToken: savedaccessToken,
                    description:
                        TextFormFieldControllers.descriptionPostController.text,
                    imageBae64: state.convertedImageToBase64!,
                    title: TextFormFieldControllers.titlePostController.text));
              },
              buttonChild: Text(
                'Post',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              width: double.infinity,
              height: AppHeight.h46,
            );
          case ForumsPostRequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ForumsPostRequestState.posted:
            return defaultButton(
              onPressed: () {},
              buttonChild: Text(
                'Post',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              width: double.infinity,
              height: AppHeight.h46,
            );
          case ForumsPostRequestState.error:
            return defaultButton(
              onPressed: () {},
              buttonChild: Text(
                'Post',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              width: double.infinity,
              height: AppHeight.h46,
            );
        }
      },
    );
  }
}
