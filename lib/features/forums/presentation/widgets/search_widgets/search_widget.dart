import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/params/app_params.dart';
import '../../bloc/forums_bloc.dart';
import '../main_posts_widgets/post_design.dart';

class SearchForumsWidget extends StatelessWidget {
  const SearchForumsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        return Expanded(
          child: state.searchForumsEntitie.isEmpty
              ? Center(
                  child: Text(
                    'Not Found',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                )
              : ListView.builder(
                  itemCount: state.searchForumsEntitie.length,
                  itemBuilder: (context, index) {
                    return PostDesignWidget(
                        postParamsObject: PostParams(
                            forumLength: state.searchForumsEntitie.length,
                            index: index,
                            isLiked: state.isLikedSearchForums[index],
                            forumsCommentsCount: state
                                .searchForumsEntitie[index]
                                .forumsCommentsEtitie
                                .length,
                            forumId: state.searchForumsEntitie[index].forumsId,
                            forumLikesCount: state.searchForumsEntitie[index]
                                .forumsLikesEntitie.length,
                            forumTitle: state.searchForumsEntitie[index].title,
                            forumDescription:
                                state.searchForumsEntitie[index].description,
                            forumImage: state.searchForumsEntitie[index].image,
                            forumsUserFirstName: state
                                .searchForumsEntitie[index]
                                .forumsUserEntitie
                                .firstName,
                            forumsUserLastName: state.searchForumsEntitie[index]
                                .forumsUserEntitie.lastName,
                            forumsUserImageUrl: state.searchForumsEntitie[index]
                                .forumsUserEntitie.imageUrl));
                  }),
        );
      },
    );
  }
}
