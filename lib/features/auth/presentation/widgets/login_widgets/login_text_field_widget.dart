import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../bloc/auth_bloc.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller: TextFormFieldControllers.emailLoginController,
            title: 'Email',
            labelStyle: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          height: AppHeight.h10,
        ),
        BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            return defaultTextFormField(
              width: double.infinity,
              height: AppHeight.h46,
              radius: AppRadius.r5,
              context: context,
              controller: TextFormFieldControllers.passwordLoginController,
              title: 'Password',
              labelStyle: Theme.of(context).textTheme.titleMedium,
              obscureText: state.loginObscureText,
              suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(LoginObscureTextEvent(!state.loginObscureText));
                  },
                  icon: Icon(
                    state.signUpObscureText
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    color: Theme.of(context).primaryColor,
                  )),
            );
          },
        ),
      ],
    );
  }
}
