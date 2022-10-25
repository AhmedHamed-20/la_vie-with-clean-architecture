import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/search_widgets/search_forums_likes_comments_widget.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/search_widgets/search_user_info_design.dart';
import '../../../../../../core/constants/constants.dart';
import '../../bloc/forums_bloc.dart';

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
                    return Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Card(
                        elevation: AppElevation.eL4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.r16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: SearchUserInfoRowDesign(index: index),
                            ),
                            const SizedBox(
                              height: AppHeight.h8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p8,
                                right: AppPadding.p8,
                              ),
                              child: Text(
                                state.searchForumsEntitie[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: AppFontSize.s20,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: AppHeight.h8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p8,
                                right: AppPadding.p8,
                              ),
                              child: Text(
                                state.searchForumsEntitie[index].description,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            const SizedBox(
                              height: AppHeight.h8,
                            ),
                            Center(
                              child: CachedNetworkImage(
                                imageUrl:
                                    state.searchForumsEntitie[index].image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return const Center(
                                    child: Text('no image availble ):'),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: AppHeight.h8,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            SearchLikesUserCommentDesign(
                              index: index,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        );
      },
    );
  }
}
