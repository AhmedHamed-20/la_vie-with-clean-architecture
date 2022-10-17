import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/widgets/post_design.dart';

import '../../../../core/components/defaults.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import 'forums_tob_tabs.dart';

class PostMainWidget extends StatelessWidget {
  const PostMainWidget({
    Key? key,
  }) : super(key: key);

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
        SizedBox(
          width: screenWidth(context),
          height: screenHeight(context) * 0.08,
          child: const ForumsTobTabsWidget(),
        ),
        const PostDesign(),
      ],
    );
  }
}
