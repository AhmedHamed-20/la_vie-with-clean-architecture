import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/media_query_of_methods.dart';

import '../../../../core/constants/constants.dart';
import '../../../auth/presentation/bloc/bloc/auth_bloc_bloc.dart';

class ChangeUserDataWidget extends StatelessWidget {
  const ChangeUserDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQueryOfMethods.getAppHeight(context) * 0.6,
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
            Container(
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
                    BlocBuilder<AuthBloc, AuthBlocState>(
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
            ),
            const SizedBox(
              height: AppHeight.h20,
            ),
            Text(
              'Edit Your Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
