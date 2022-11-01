import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme_mode_feature/presentation/bloc/theme_mode_bloc.dart';

class ChangeThemeBottomSheetWidget extends StatelessWidget {
  const ChangeThemeBottomSheetWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (context, state) {
        var themeBloc = BlocProvider.of<ThemeModeBloc>(context);
        return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.r22),
                    topRight: Radius.circular(AppRadius.r22))),
            height: screenHeight(context) * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Column(
                children: [
                  Text(
                    'Select Theme Mode',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: AppHeight.h10,
                  ),
                  Expanded(
                    child: ListView(children: [
                      RadioListTile<int>(
                        activeColor: Theme.of(context).primaryColor,
                        title: Text(
                          'Light Mode',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        value: 0,
                        groupValue: state.themeModeValue.index,
                        onChanged: (value) {
                          themeBloc.add(
                              ChangeThemeModeEvent(ThemeDataValue.lightMode));
                          context
                              .read<ThemeModeBloc>()
                              .add(const CacheThemeModeEvent(false));
                        },
                      ),
                      RadioListTile<int>(
                        activeColor: Theme.of(context).primaryColor,
                        title: Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        value: 1,
                        groupValue: state.themeModeValue.index,
                        onChanged: (value) {
                          themeBloc.add(
                              ChangeThemeModeEvent(ThemeDataValue.darkMode));
                          themeBloc.add(const CacheThemeModeEvent(true));
                        },
                      ),
                    ]),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
