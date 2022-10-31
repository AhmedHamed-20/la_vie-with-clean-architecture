import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/main_posts_widgets/post_bottom_sheet_comments.dart';

import '../../../../../../core/constants/constants.dart';
import '../../bloc/forums_bloc.dart';

class PostLikesCommentsWidget extends StatelessWidget {
  const PostLikesCommentsWidget(
      {Key? key,
      required this.forumsLikesCount,
      required this.forumId,
      required this.forumsCommentsCount,
      required this.index,
      required this.isLiked})
      : super(key: key);
  final String forumId;
  final bool isLiked;
  final int forumsLikesCount;
  final int forumsCommentsCount;
  final int index;
  @override
  Widget build(BuildContext context) {
    final forumsBloc = BlocProvider.of<ForumsBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.r16))),
                elevation: MaterialStatePropertyAll(isLiked ? 2 : 0),
                backgroundColor: MaterialStatePropertyAll(isLiked
                    ? Theme.of(context).primaryColor
                    : AppColors.transparentColor)),
            onPressed: () {
              context
                  .read<ForumsBloc>()
                  .add(LikesAddEvent(savedaccessToken, forumId));
            },
            child: Row(
              children: [
                Icon(
                  isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                  color: isLiked
                      ? AppColors.white
                      : Theme.of(context).iconTheme.color,
                ),
                const SizedBox(
                  width: AppWidth.w8,
                ),
                Text(forumsLikesCount.toString(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isLiked ? AppColors.white : AppColors.black))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        AppRadius.r22,
                      ),
                      topRight: Radius.circular(
                        AppRadius.r22,
                      ),
                    ),
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  context: context,
                  builder: (context) {
                    return BlocProvider.value(
                      value: forumsBloc,
                      child: PostCommentsBottomSheetWidget(
                        index: index,
                        forumId: forumId,
                      ),
                    );
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.iconColorGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppRadius.r16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Row(
                  children: [
                    Icon(
                      Icons.mode_comment_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    const SizedBox(
                      width: AppWidth.w8,
                    ),
                    Text(forumsCommentsCount.toString(),
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
