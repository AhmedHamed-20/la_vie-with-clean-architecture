import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../bloc/forums_bloc.dart';

class PostForumsMeDesign extends StatelessWidget {
  const PostForumsMeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        //  print('value ${state.activeListOfLikes}');
        return Expanded(
          child: ListView.builder(
              itemCount: state.forumsMeEntitie.length,
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
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                  filterQuality: FilterQuality.low,
                                  width: 50,
                                  height: 50,
                                  imageBuilder: (context, imageprovider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageprovider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  imageUrl: state.forumsMeEntitie[index]
                                      .forumsUserEntitie.imageUrl,
                                  errorWidget: (context, url, error) {
                                    return const Center(
                                      child: Text('no image...'),
                                    );
                                  }),
                              const SizedBox(
                                width: AppWidth.w8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.forumsMeEntitie[index].forumsUserEntitie.firstName} ${state.forumsMeEntitie[index].forumsUserEntitie.lastName}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    '2 days ago',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            ],
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
                            state.forumsMeEntitie[index].title,
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
                            state.forumsMeEntitie[index].description,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        const SizedBox(
                          height: AppHeight.h8,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: state.forumsMeEntitie[index].image,
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
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<ForumsBloc>().add(
                                        LikesAddEvent(
                                            accessToken,
                                            state.forumsMeEntitie[index]
                                                .forumsId));
                                  },
                                  icon: Icon(
                                    state.isLikedMeForums[index]
                                        ? Icons.thumb_up_alt
                                        : Icons.thumb_up_alt_outlined,
                                    color: AppColors.iconColorGrey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    state.forumsMeEntitie[index]
                                        .forumsLikesEntitie.length
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: AppWidth.w16,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                state.forumsMeEntitie[index]
                                    .forumsCommentsEtitie.length
                                    .toString(),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
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
