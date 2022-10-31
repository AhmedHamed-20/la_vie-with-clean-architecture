import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme_mode_feature/presentation/bloc/theme_mode_bloc.dart';
import 'change_information_card_widget.dart';
import 'change_theme_bottom_sheet_widget.dart';

class ChangeThemeModeWidget extends StatelessWidget {
  const ChangeThemeModeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                // backgroundColor: Theme.of(context).backgroundColor,
                enableDrag: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const ChangeThemeBottomSheetWidget();
                });
          },
          child: changeCardInformation(
              context: context, title: 'Change Theme Mode'),
        );
      },
    );
  }
}
