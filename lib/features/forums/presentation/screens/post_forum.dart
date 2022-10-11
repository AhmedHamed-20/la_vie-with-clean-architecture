import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../../products/domain/entities/user_data.dart';

import '../../../../core/components/defaults.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../../../core/utl/utls.dart';
import '../bloc/forums_bloc.dart';

class PostForumScreen extends StatelessWidget {
  const PostForumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //TODO remove it after include all forums ui
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
              color: AppColors.iconColorGrey,
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
              BlocBuilder<ForumsBloc, ForumsState>(
                builder: (context, state) {
                  print(state.convertedImageToBase64);
                  switch (state.imagePickeRequestState) {
                    case ImagePickeRequestState.loading:
                      return GestureDetector(
                        onTap: () {
                          context.read<ForumsBloc>().add(PickImageEvent());
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(
                                AppRadius.r5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(AppPadding.p30),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(
                                    height: AppHeight.h8,
                                  ),
                                  Text(
                                    'Add Photo',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                    case ImagePickeRequestState.picked:
                      return GestureDetector(
                        onTap: () {
                          context.read<ForumsBloc>().add(PickImageEvent());
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(
                                AppRadius.r5,
                              ),
                            ),
                          ),
                        ),
                      );
                    case ImagePickeRequestState.error:
                      return Text('error');
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
                height: AppHeight.h46,
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
                height: AppHeight.h100,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.descriptionPostController,
              ),
              const SizedBox(
                height: AppHeight.h12,
              ),
              BlocBuilder<ForumsBloc, ForumsState>(
                builder: (context, state) {
                  switch (state.forumsPostRequestState) {
                    case ForumsPostRequestState.idle:
                      return defaultButton(
                        onPressed: () {
                          context.read<ForumsBloc>().add(ForumsPostEvent(
                              accessToken:
                                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQwMjkwNC00MzMxLTRkOGEtODRmOC1hOGVkNjRjMjVmM2IiLCJpYXQiOjE2NjQ5MjMxMjEsImV4cCI6MTY2NTA5NTkyMX0.Ki-V2wepIiRwJ-oazru800Ci-radI3jHPP-gn7IZWWY',
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
                      print('error');
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
