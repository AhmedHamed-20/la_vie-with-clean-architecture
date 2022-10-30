import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:la_vie_with_clean_architecture/features/auth/presentation/widgets/sign_up_widgets/sign_up_button.dart';
import 'package:la_vie_with_clean_architecture/features/auth/presentation/widgets/sign_up_widgets/sign_up_text_fileds.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utl/utls.dart';
import '../../bloc/auth_bloc.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    super.initState();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) FocusScope.of(context).unfocus();
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppPadding.p8),
          child: Column(
            children: [
              const SignUpTextFields(),
              const SizedBox(
                height: AppHeight.h10,
              ),
              BlocConsumer<AuthBloc, AuthBlocState>(
                listener: (context, state) {
                  if (state.signUpRequestState.name == 'cachedSuccess') {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutesNames.homeScreen, (route) => false);
                    // context
                    //     .read<MainLayoutBloc>()
                    //     .add(const GetAccessTokenFromCacheEvent('accessToken'));

                    context.read<AuthBloc>().clearAllAuthTextFiledsData();
                  }
                  if (state.signUpRequestState.name == 'error') {
                    flutterToast(
                        msg: state.authMessage,
                        backgroundColor: AppColors.toastError,
                        textColor: AppColors.white);
                  }
                },
                builder: (context, state) {
                  switch (state.signUpRequestState) {
                    case SignUpRequestState.idle:
                      return const SignUpButtomWidget();
                    case SignUpRequestState.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case SignUpRequestState.signUploaded:
                      context.read<AuthBloc>().add(
                            AccessTokenCacheEvent(
                              state.authDataEntitie!.accessToken,
                              false,
                            ),
                          );
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case SignUpRequestState.error:
                      return const SignUpButtomWidget();
                    case SignUpRequestState.cachedSuccess:
                      return const SignUpButtomWidget();
                  }
                },
              ),
              const SizedBox(
                height: AppHeight.h12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
