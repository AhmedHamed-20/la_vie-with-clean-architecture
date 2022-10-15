import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';

import '../../../../core/constants/constants.dart';

class UpPhotoWidget extends StatelessWidget {
  const UpPhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BlocBuilder<MainLayoutBloc, MainLayoutState>(
            builder: (context, state) {
              return SizedBox(
                height: double.infinity,
                child: Image.network(
                  state.userDataEntitie!.imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.iconColorWhite,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.logout_outlined,
                  color: AppColors.iconColorWhite,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: BlocBuilder<MainLayoutBloc, MainLayoutState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: AppRadius.r70,
                      backgroundImage:
                          NetworkImage(state.userDataEntitie!.imageUrl),
                    ),
                    const SizedBox(
                      height: AppHeight.h8,
                    ),
                    Text(
                      '${state.userDataEntitie!.firstName} ${state.userDataEntitie!.lastName}',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: AppFontSize.s20,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
