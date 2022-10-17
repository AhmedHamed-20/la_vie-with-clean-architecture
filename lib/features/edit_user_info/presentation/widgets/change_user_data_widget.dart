import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/media_query_of_methods.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/text_fileds_controlers/textfiled_controlers.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/presentation/widgets/change_information_card_widget.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/user_info_bloc.dart';
import 'bottom_sheet_widget.dart';

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
            ),
            const SizedBox(
              height: AppHeight.h20,
            ),
            Text(
              'Edit Your Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            BlocBuilder<MainLayoutBloc, MainLayoutState>(
              builder: (context, mainLayoutState) {
                return BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, userInfoState) {
                    return InkWell(
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
                              return BottomSheetWidget(
                                bottomSheetTittle: 'Change Name',
                                controller: TextFormFieldControllers
                                    .changeNameController,
                                onPressedOnConfirm: () {
                                  if (TextFormFieldControllers
                                          .changeNameController.text
                                          .contains(',') ==
                                      false) {
                                    flutterToast(
                                      msg:
                                          'please enter first name and last name separted by comma and with no spaces',
                                      backgroundColor: AppColors.toastError,
                                      textColor: AppColors.white,
                                    );
                                  } else {
                                    final firstName = TextFormFieldControllers
                                        .changeNameController.text
                                        .trim()
                                        .substring(
                                            0,
                                            TextFormFieldControllers
                                                .changeNameController.text
                                                .indexOf(','));
                                    final lastName = TextFormFieldControllers
                                        .changeNameController.text
                                        .trim()
                                        .substring(
                                            TextFormFieldControllers
                                                    .changeNameController.text
                                                    .indexOf(',') +
                                                1,
                                            TextFormFieldControllers
                                                .changeNameController
                                                .text
                                                .length);
                                    context.read<UserInfoBloc>().add(
                                        UpdatedUserDataEvent(
                                            firstName: firstName,
                                            lastName: lastName,
                                            email: userInfoState
                                                    .updatedUserDataEntitie
                                                    ?.email ??
                                                mainLayoutState
                                                    .userDataEntitie!.email,
                                            address: 'address',
                                            accessToken: accessToken));
                                  }
                                },
                              );
                            });
                      },
                      child: changeCardInformation(
                        context: context,
                        title: 'Change Name',
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<MainLayoutBloc, MainLayoutState>(
              builder: (context, mainLayoutstate) {
                return BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, userInfoState) {
                    return InkWell(
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
                              return BottomSheetWidget(
                                bottomSheetTittle: 'Change Email',
                                controller: TextFormFieldControllers
                                    .changeEmailController,
                                onPressedOnConfirm: () {
                                  context.read<UserInfoBloc>().add(
                                      UpdatedUserDataEvent(
                                          firstName:
                                              userInfoState
                                                      .updatedUserDataEntitie
                                                      ?.firstName ??
                                                  mainLayoutstate
                                                      .userDataEntitie!
                                                      .firstName,
                                          lastName: userInfoState
                                                  .updatedUserDataEntitie?.lastName ??
                                              mainLayoutstate
                                                  .userDataEntitie!.lastName,
                                          email: TextFormFieldControllers
                                              .changeEmailController.text
                                              .trim(),
                                          address: 'address',
                                          accessToken: accessToken));
                                },
                              );
                            });
                      },
                      child: changeCardInformation(
                        context: context,
                        title: 'Change Email',
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
