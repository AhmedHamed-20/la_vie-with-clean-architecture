import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../bloc/auth_bloc.dart';

class SignUpButtomWidget extends StatelessWidget {
  const SignUpButtomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) => defaultButton(
        onPressed: () {
          if (state.isEmailSignUpVaild &&
              state.isPasswordSignUpVaild &&
              state.isPasswordConfirmSignUpVaild) {
            context.read<AuthBloc>().add(SignupEvent(
                passwordConfirm: TextFormFieldControllers
                    .passwordConfirmSignUpController.text
                    .trim(),
                firstName: TextFormFieldControllers
                    .firstNameSignUpController.text
                    .trim(),
                lastName: TextFormFieldControllers.lastNameSignUpController.text
                    .trim(),
                email:
                    TextFormFieldControllers.emailSignUpController.text.trim(),
                password: TextFormFieldControllers.passwordSignUpController.text
                    .trim()));
          } else {
            flutterToast(
                msg: 'please make sure that you enter all data and it\'s valid',
                backgroundColor: AppColors.toastError,
                textColor: AppColors.white);
          }
        },
        buttonChild: Text(
          'SignUp',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.white),
        ),
        width: double.infinity,
        height: AppHeight.h46,
      ),
    );
  }
}
