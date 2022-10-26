import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.r10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.starsCircleBorder),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p6),
                child: Center(child: Container()),
              ),
            ),
            const SizedBox(
              width: AppWidth.w8,
            ),
            BlocBuilder<MainLayoutBloc, MainLayoutState>(
              builder: (context, state) {
                return Text(
                  '${state.userDataEntitie!.userPoints} points',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
