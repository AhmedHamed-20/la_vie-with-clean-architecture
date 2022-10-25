import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/forums_me_widgets/forums_me_bottom_model_sheet.dart';

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
    final forumsBloc = BlocProvider.of<ForumsBloc>(context);
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        return Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ForumsBloc>().add(LikesAddEvent(
                        savedaccessToken,
                        state.forumsMeEntitie[index].forumsId));
                  },
                  icon: Icon(
                    state.isLikedMeForums[index]
                        ? Icons.thumb_up_alt
                        : Icons.thumb_up_alt_outlined,
                    color: AppColors.iconColorGrey,
                  ),
                ),
                Text(
                  state.forumsMeEntitie[index].forumsLikesEntitie.length
                      .toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(
              width: AppWidth.w16,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Theme.of(context).backgroundColor,
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
                    context: context,
                    builder: (context) {
                      return BlocProvider.value(
                        value: forumsBloc,
                        child: ForumsMeBottomModelSheet(index: index),
                      );
                    });
              },
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
