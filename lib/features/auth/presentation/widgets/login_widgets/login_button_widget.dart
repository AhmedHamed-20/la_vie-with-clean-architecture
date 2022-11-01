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
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) => defaultButton(
        onPressed: () {
          if (state.isEmailLoginVaild && state.isPasswordLoginVaild) {
            authBloc.add(LoginEvent(
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
