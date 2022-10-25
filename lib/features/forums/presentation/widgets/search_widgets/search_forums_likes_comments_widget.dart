import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/search_widgets/search_forums_bottom_sheet_widget.dart';

import '../../../../../core/constants/constants.dart';
import '../../bloc/forums_bloc.dart';

class SearchLikesUserCommentDesign extends StatelessWidget {
  const SearchLikesUserCommentDesign({
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
                    context.read<ForumsBloc>().add(LikesAddEvent(accessToken,
                        state.searchForumsEntitie[index].forumsId));
                  },
                  icon: Icon(
                    state.isLikedAllForums[index]
                        ? Icons.thumb_up_alt
                        : Icons.thumb_up_alt_outlined,
                    color: AppColors.iconColorGrey,
                  ),
                ),
                Text(
                  state.searchForumsEntitie[index].forumsLikesEntitie.length
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
                        child: SearchBottomSheetCommentsWidget(
                          index: index,
                        ),
                      );
                    });
              },
              child: Text(
                state.searchForumsEntitie[index].forumsCommentsEtitie.length
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
