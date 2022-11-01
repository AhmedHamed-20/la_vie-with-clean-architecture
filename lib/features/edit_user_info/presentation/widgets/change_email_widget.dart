import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../bloc/user_info_bloc.dart';
import 'bottom_sheet_widget.dart';
import 'change_information_card_widget.dart';

class ChangeEmailWidget extends StatelessWidget {
  const ChangeEmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userInfoBloc = BlocProvider.of<UserInfoBloc>(context);

    return BlocBuilder<MainLayoutBloc, MainLayoutState>(
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
                      return BlocProvider.value(
                        value: userInfoBloc,
                        child: BottomSheetWidget(
                          bottomSheetTittle: 'Change Email',
                          controller:
                              TextFormFieldControllers.changeEmailController,
                          onPressedOnConfirm: () {
                            userInfoBloc.add(UpdatedUserDataEvent(
                                firstName: userInfoState
                                        .updatedUserDataEntitie?.firstName ??
                                    mainLayoutstate.userDataEntitie!.firstName,
                                lastName: userInfoState
                                        .updatedUserDataEntitie?.lastName ??
                                    mainLayoutstate.userDataEntitie!.lastName,
                                email: TextFormFieldControllers
                                    .changeEmailController.text
                                    .trim(),
                                address: 'address',
                                accessToken: savedaccessToken));
                          },
                        ),
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
    );
  }
}
