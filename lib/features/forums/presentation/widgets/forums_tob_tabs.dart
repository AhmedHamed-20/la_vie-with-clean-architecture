import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';

import '../../../../core/widgets/tob_tab.dart';
import '../bloc/forums_bloc.dart';

class ForumsTobTabsWidget extends StatelessWidget {
  const ForumsTobTabsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<ForumsBloc>().add(ActiveTabForumsEvent(index));
              },
              child: TobTabs(
                tabs: const ['All Forums', 'My Forums'],
                currentWidgetIndex: index,
                context: context,
                currentActiveTab: state.currentActiveIndex,
              ),
            );
          },
        );
      },
    );
  }
}
