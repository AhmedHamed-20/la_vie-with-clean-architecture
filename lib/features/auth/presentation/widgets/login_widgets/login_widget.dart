import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utl/utls.dart';
import '../../bloc/auth_bloc.dart';
import 'login_button_widget.dart';
import 'login_text_field_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
    var authBloc = BlocProvider.of<AuthBloc>(context);

    return Expanded(
      flex: 6,
      child: Column(
        children: [
          const LoginTextFields(),
          const SizedBox(
            height: AppHeight.h10,
          ),
          BlocConsumer<AuthBloc, AuthBlocState>(
            listener: (context, state) {
              if (state.authState.name == 'cachedSuccess') {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutesNames.homeScreen, (route) => false);

                authBloc.clearAllAuthTextFiledsData();
              }
              if (state.authState.name == 'error') {
                flutterToast(
                    msg: state.authMessage,
                    backgroundColor: AppColors.toastError,
                    textColor: AppColors.white);
              }
            },
            builder: (context, state) {
              switch (state.authState) {
                case RequestState.idle:
                  return const LoginButtonWidget();
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.loginloaded:
                  authBloc.add(
                    AccessTokenCacheEvent(
                      state.authDataEntitie!.accessToken,
                      true,
                    ),
                  );
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case RequestState.error:
                  return const LoginButtonWidget();
                case RequestState.cachedSuccess:
                  return const LoginButtonWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
