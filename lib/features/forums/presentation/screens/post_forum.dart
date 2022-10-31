import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/services/service_locator.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/forums_bloc.dart';
import '../widgets/post_forum_widgets/add_photo_widget_states.dart';
import '../widgets/post_forum_widgets/add_post_button_states_widget.dart';
import '../widgets/post_forum_widgets/title_description_widgets.dart';

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
            children: const [
              AddPhotoWidgetStates(),
              TitleAndDescriptionWidgets(),
              SizedBox(
                height: AppHeight.h12,
              ),
              AddPostButtonStatesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
