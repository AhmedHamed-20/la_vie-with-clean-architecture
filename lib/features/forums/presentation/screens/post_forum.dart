import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/services/service_locator.dart';

import '../../../../core/components/defaults.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../../../core/utl/utls.dart';
import '../bloc/forums_bloc.dart';
import '../widgets/add_post_widgets/add_photo_widget.dart';

class PostForumScreen extends StatelessWidget {
  const PostForumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<ForumsBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Create New Post',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<ForumsBloc, ForumsState>(
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
                        child: Center(
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
              ),
              Text(
                'Title',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: AppHeight.h8,
              ),
              defaultTextFormField(
                width: double.infinity,
                height: AppHeight.h70,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.titlePostController,
              ),
              const SizedBox(
                height: AppHeight.h8,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: AppHeight.h8,
              ),
              defaultTextFormField(
                maxLine: 6,
                width: double.infinity,
                height: AppHeight.h130,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.descriptionPostController,
              ),
              const SizedBox(
                height: AppHeight.h12,
              ),
              BlocConsumer<ForumsBloc, ForumsState>(
                listener: (context, state) {
                  if (state.forumsPostRequestState.name == 'posted') {
                    flutterToast(
                        msg: 'Posted Successfuly',
                        backgroundColor: AppColors.toastSuccess,
                        textColor: AppColors.white);
                    context.read<ForumsBloc>().add(ForumsMeEvent(
                        accessToken: savedaccessToken, userId: userId));

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
                              description: TextFormFieldControllers
                                  .descriptionPostController.text,
                              imageBae64: state.convertedImageToBase64!,
                              title: TextFormFieldControllers
                                  .titlePostController.text));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
