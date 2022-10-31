import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/presentation/widgets/points_widget.dart';

import '../../../../core/constants/constants.dart';
import 'change_email_widget.dart';
import 'change_name_widget.dart';
import 'change_theme_mode_widget.dart';

//0 light 1 dark
int selected = 0;

class ChangeUserDataWidget extends StatelessWidget {
  const ChangeUserDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context) * 0.6,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadius.r22),
          topRight: Radius.circular(AppRadius.r22),
        ),
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PointWidget(),
            const SizedBox(
              height: AppHeight.h20,
            ),
            Text(
              'Edit Your Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const ChangeNameWidget(),
            const ChangeEmailWidget(),
            const ChangeThemeModeWidget(),
          ],
        ),
      ),
    );
  }
}
