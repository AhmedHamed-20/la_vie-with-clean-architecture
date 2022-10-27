import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/post_bottom_sheet_comments.dart';

import '../../../../../core/constants/constants.dart';
import '../bloc/forums_bloc.dart';

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
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: isLiked
                  ? Theme.of(context).primaryColor
                  : AppColors.transparentColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppRadius.r16))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context
                        .read<ForumsBloc>()
                        .add(LikesAddEvent(savedaccessToken, forumId));
                  },
                  icon: Icon(
                    isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                    color: isLiked ? AppColors.white : AppColors.iconColorGrey,
                  ),
                ),
                Text(
                  forumsLikesCount.toString(),
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color:
                          isLiked ? AppColors.white : AppColors.iconColorGrey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: AppWidth.w16,
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
          child: Text(
            forumsCommentsCount.toString(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
