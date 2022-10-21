import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../bloc/forums_bloc.dart';

class ForumsMeLikesAndCommentsWidget extends StatelessWidget {
  const ForumsMeLikesAndCommentsWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        return Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ForumsBloc>().add(LikesAddEvent(
                        accessToken, state.forumsMeEntitie[index].forumsId));
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
                    state.forumsMeEntitie[index].forumsLikesEntitie.length
                        .toString(),
                    style: Theme.of(context).textTheme.subtitle1,
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
                state.forumsMeEntitie[index].forumsCommentsEtitie.length
                    .toString(),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        );
      },
    );
  }
}
