import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/params/app_params.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/post_design.dart';

import '../../bloc/forums_bloc.dart';

class PostForumsMeDesign extends StatelessWidget {
  const PostForumsMeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              itemCount: state.forumsMeEntitie.length,
              itemBuilder: (context, index) {
                return PostDesignWidget(
                    postParamsObject: PostParams(
                        forumLength: state.forumsMeEntitie.length,
                        index: index,
                        isLiked: state.isLikedMeForums[index],
                        forumsCommentsCount: state
                            .forumsMeEntitie[index].forumsCommentsEtitie.length,
                        forumId: state.forumsMeEntitie[index].forumsId,
                        forumLikesCount: state
                            .forumsMeEntitie[index].forumsLikesEntitie.length,
                        forumTitle: state.forumsMeEntitie[index].title,
                        forumDescription:
                            state.forumsMeEntitie[index].description,
                        forumImage: state.forumsMeEntitie[index].image,
                        forumsUserFirstName: state
                            .forumsMeEntitie[index].forumsUserEntitie.firstName,
                        forumsUserLastName: state
                            .forumsMeEntitie[index].forumsUserEntitie.lastName,
                        forumsUserImageUrl: state.forumsMeEntitie[index]
                            .forumsUserEntitie.imageUrl));
              }),
        );
      },
    );
  }
}
