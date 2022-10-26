import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../bloc/auth_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) => defaultButton(
        onPressed: () {
          if (state.isEmailLoginVaild && state.isPasswordLoginVaild) {
            context.read<AuthBloc>().add(LoginEvent(
                email: TextFormFieldControllers.emailLoginController.text,
                password:
                    TextFormFieldControllers.passwordLoginController.text));
          } else {
            flutterToast(
                msg: 'please make sure that you enter all data and it\'s valid',
                backgroundColor: AppColors.toastError,
                textColor: AppColors.white);
          }
        },
        buttonChild: Text(
          'Login',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        width: double.infinity,
        height: AppHeight.h46,
      ),
    );
  }
}
