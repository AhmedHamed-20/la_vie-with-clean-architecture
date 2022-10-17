import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/text_fileds_controlers/textfiled_controlers.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/presentation/bloc/user_info_bloc.dart';

import '../../../../core/components/defaults.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utl/utls.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
    required this.bottomSheetTittle,
    required this.controller,
    required this.onPressedOnConfirm,
  }) : super(key: key);
  final String bottomSheetTittle;
  final VoidCallback onPressedOnConfirm;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              bottomSheetTittle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: AppHeight.h18,
            ),
            Text(
              bottomSheetTittle == 'Change Name'
                  ? 'separate between last name and first name by comma ,'
                  : 'Enter Your New Email',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: AppHeight.h18,
            ),
            defaultTextFormField(
              width: double.infinity,
              height: AppHeight.h46,
              radius: AppRadius.r10,
              context: context,
              controller: controller,
            ),
            const SizedBox(
              height: AppHeight.h18,
            ),
            BlocConsumer<UserInfoBloc, UserInfoState>(
              listener: (context, state) {
                if (state.updateUserDataRequestState.name ==
                    'updatedSuccessfully') {
                  Navigator.of(context).pop();
                  TextFormFieldControllers.changeEmailController.clear();
                  TextFormFieldControllers.changeNameController.clear();
                  flutterToast(
                      msg: 'Updated Successfully',
                      backgroundColor: AppColors.toastSuccess,
                      textColor: AppColors.white);
                }
              },
              builder: (context, state) {
                switch (state.updateUserDataRequestState) {
                  case UpdateUserDataRequestState.idle:
                    return defaultButton(
                      onPressed: onPressedOnConfirm,
                      buttonChild: Text(
                        'Confirm',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      width: double.infinity,
                      height: AppHeight.h46,
                    );
                  case UpdateUserDataRequestState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case UpdateUserDataRequestState.updatedSuccessfully:
                    return defaultButton(
                      onPressed: onPressedOnConfirm,
                      buttonChild: Text(
                        'Confirm',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      width: double.infinity,
                      height: AppHeight.h46,
                    );
                  case UpdateUserDataRequestState.error:
                    print(state.updatedUserDataErrorMessage);
                    return defaultButton(
                      onPressed: onPressedOnConfirm,
                      buttonChild: Text(
                        'Confirm',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      width: double.infinity,
                      height: AppHeight.h46,
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
