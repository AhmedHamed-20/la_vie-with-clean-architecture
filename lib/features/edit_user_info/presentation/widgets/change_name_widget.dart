import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../bloc/user_info_bloc.dart';
import 'bottom_sheet_widget.dart';
import 'change_information_card_widget.dart';
import 'package:flutter/material.dart';

class ChangeNameWidget extends StatelessWidget {
  const ChangeNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userInfoBloc = BlocProvider.of<UserInfoBloc>(context);
    return BlocBuilder<MainLayoutBloc, MainLayoutState>(
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
                      return BlocProvider.value(
                        value: userInfoBloc,
                        child: BottomSheetWidget(
                          bottomSheetTittle: 'Change Name',
                          controller:
                              TextFormFieldControllers.changeNameController,
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
                                          .changeNameController.text.length);
                              context.read<UserInfoBloc>().add(
                                  UpdatedUserDataEvent(
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: userInfoState
                                              .updatedUserDataEntitie?.email ??
                                          mainLayoutState
                                              .userDataEntitie!.email,
                                      address: 'address',
                                      accessToken: savedaccessToken));
                            }
                          },
                        ),
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
    );
  }
}
