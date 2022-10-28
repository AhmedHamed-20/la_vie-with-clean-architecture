import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/params/app_params.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/main_posts_widgets/post_likes_comments_widget.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/main_posts_widgets/post_user_info.dart';

import '../../../../../core/constants/constants.dart';

class PostDesignWidget extends StatelessWidget {
  const PostDesignWidget({super.key, required this.postParamsObject});
  final PostParams postParamsObject;
  @override
  Widget build(BuildContext context) {
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
              child: PostUserInfoRowWidget(
                  forumsUserFirstName: postParamsObject.forumsUserFirstName,
                  forumsUserImage: postParamsObject.forumsUserImageUrl,
                  forumsUserLastName: postParamsObject.forumsUserLastName),
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
                postParamsObject.forumTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                postParamsObject.forumDescription,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(
              height: AppHeight.h8,
            ),
            Center(
              child: CachedNetworkImage(
                imageUrl: postParamsObject.forumImage,
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
            PostLikesCommentsWidget(
              index: postParamsObject.index,
              forumId: postParamsObject.forumId,
              forumsCommentsCount: postParamsObject.forumsCommentsCount,
              forumsLikesCount: postParamsObject.forumLikesCount,
              isLiked: postParamsObject.isLiked,
            ),
          ],
        ),
      ),
    );
  }
}
