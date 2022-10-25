import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/all_forums_widgtes/post_allforums_design.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/forums_me_widgets/post_forums_me_design.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/search_widgets/search_widget.dart';

import '../../../../core/components/defaults.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../../../core/utl/utls.dart';
import '../bloc/forums_bloc.dart';
import 'forums_tob_tabs.dart';

class PostMainWidget extends StatefulWidget {
  const PostMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PostMainWidget> createState() => _PostMainWidgetState();
}

class _PostMainWidgetState extends State<PostMainWidget> {
  @override
  void initState() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    super.initState();
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: SizedBox(
            width: screenWidth(context),
            height: screenHeight(context) * 0.08,
            child: mobileHomeSearchBar(
              width: double.infinity,
              height: AppHeight.h10,
              radius: AppRadius.r10,
              context: context,
              controller: TextFormFieldControllers.forumsSearchController,
              onChanged: (value) {
                Future.delayed(const Duration(seconds: 1), () {
                  context.read<ForumsBloc>().add(
                        ForumsSearchEvent(
                          value,
                          accessToken,
                        ),
                      );
                });
              },
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.iconColorGrey,
              ),
              label: Text(
                'Search',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.titleTextColor,
                    ),
              ),
            ),
          ),
        ),
        BlocBuilder<ForumsBloc, ForumsState>(
          builder: (context, state) {
            if (state.searchForumsEntitie == const [] ||
                TextFormFieldControllers.forumsSearchController.text.isEmpty) {
              return SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.08,
                child: const ForumsTobTabsWidget(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        BlocBuilder<ForumsBloc, ForumsState>(
          builder: (context, state) {
            if (state.searchForumsEntitie == const [] ||
                TextFormFieldControllers.forumsSearchController.text.isEmpty) {
              if (state.currentActiveIndex == 0) {
                return const PostAllForumsDesign();
              } else {
                return const PostForumsMeDesign();
              }
            } else {
              switch (state.searchForumRequestState) {
                case SearchForumRequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case SearchForumRequestState.loaded:
                  return const SearchForumsWidget();
                case SearchForumRequestState.error:
                  if (state.currentActiveIndex == 0) {
                    return const PostAllForumsDesign();
                  } else {
                    return const PostForumsMeDesign();
                  }
              }
            }
          },
        ),
      ],
    );
  }
}
