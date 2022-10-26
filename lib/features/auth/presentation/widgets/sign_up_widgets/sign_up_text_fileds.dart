import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../bloc/auth_bloc.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: defaultTextFormField(
                keyboardType: TextInputType.text,
                width: double.infinity,
                height: AppHeight.h70,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.firstNameSignUpController,
                title: 'FirstName',
                labelStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              width: AppWidth.w14,
            ),
            Expanded(
              child: defaultTextFormField(
                keyboardType: TextInputType.text,
                width: double.infinity,
                height: AppHeight.h70,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.lastNameSignUpController,
                title: 'LastName',
                labelStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppHeight.h10,
        ),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: defaultTextFormField(
            validator: (value) => context
                .read<AuthBloc>()
                .validateEmail(value: value, isLogin: false),
            keyboardType: TextInputType.emailAddress,
            width: double.infinity,
            height: AppHeight.h70,
            radius: AppRadius.r5,
            context: context,
            controller: TextFormFieldControllers.emailSignUpController,
            title: 'Email',
            labelStyle: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppHeight.h10,
        ),
        BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: defaultTextFormField(
                validator: (value) => context
                    .read<AuthBloc>()
                    .validatePassword(value: value, isLogin: false),
                keyboardType: TextInputType.visiblePassword,
                width: double.infinity,
                height: AppHeight.h70,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.passwordSignUpController,
                title: 'Password',
                labelStyle: Theme.of(context).textTheme.titleMedium,
                obscureText: state.signUpObscureText,
                suffixIcon: IconButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                          SignUpObscureTextEvent(!state.signUpObscureText));
                    },
                    icon: Icon(
                      state.signUpObscureText
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: Theme.of(context).primaryColor,
                    )),
              ),
            );
          },
        ),
        const SizedBox(
          height: AppHeight.h10,
        ),
        BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SizedBox(
                child: defaultTextFormField(
                  validator: (value) {
                    return context.read<AuthBloc>().validatePassowrdConfirm(
                        value,
                        TextFormFieldControllers.passwordSignUpController.text);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  width: double.infinity,
                  height: AppHeight.h70,
                  radius: AppRadius.r5,
                  context: context,
                  controller:
                      TextFormFieldControllers.passwordConfirmSignUpController,
                  title: 'Confirm Password',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  obscureText: state.signUpObscureText,
                  suffixIcon: IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                            SignUpObscureTextEvent(!state.signUpObscureText));
                      },
                      icon: Icon(
                        state.signUpObscureText
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: Theme.of(context).primaryColor,
                      )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
