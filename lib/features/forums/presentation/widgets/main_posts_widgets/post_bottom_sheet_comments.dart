import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/defaults.dart';
import 'package:la_vie_with_clean_architecture/core/text_fileds_controlers/textfiled_controlers.dart';

import '../../../../../../core/constants/constants.dart';
import '../../bloc/forums_bloc.dart';

class PostCommentsBottomSheetWidget extends StatelessWidget {
  const PostCommentsBottomSheetWidget({
    Key? key,
    required this.forumId,
    required this.index,
  }) : super(key: key);

  final String forumId;
  final int index;

  @override
  Widget build(context) {
    late List comments;
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        if (state.currentActiveIndex == 0) {
          comments = state.allForumsEntitie[index].forumsCommentsEtitie;
        } else {
          comments = state.forumsMeEntitie[index].forumsCommentsEtitie;
        }
        return SizedBox(
            width: screenWidth(context),
            height: screenHeight(context) * 0.8,
            child: Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p8,
                  right: AppPadding.p8,
                  top: AppPadding.p8,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Comments',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: AppHeight.h6,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: comments.length,
                      itemBuilder: (context, commentIndex) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(defaultImage),
                          ),
                          title: Text(
                            comments[commentIndex].comment,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Text(
                            DateTimeFormat.format(
                                DateTime.parse(
                                    comments[commentIndex].createdAt),
                                format: 'D, M j, H:i'),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 2,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultTextFormField(
                      controller: TextFormFieldControllers.addCommentController,
                      width: double.infinity,
                      height: AppHeight.h70,
                      radius: AppRadius.r12,
                      context: context,
                      title: 'Add Comment',
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<ForumsBloc>().add(
                                AddCommentEvent(
                                  forumId: forumId,
                                  accessToken: savedaccessToken,
                                  comment: TextFormFieldControllers
                                      .addCommentController.text,
                                ),
                              );
                        },
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
