import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
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
              if (state.accessTokenCached) {
                context
                    .read<MainLayoutBloc>()
                    .add(const GetAccessTokenFromCacheEvent('accessToken'));
                Navigator.of(context).pushNamed(AppRoutesNames.homeScreen);
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
                  context.read<AuthBloc>().add(
                        AccessTokenCacheEvent(
                          state.authDataEntitie!.accessToken,
                        ),
                      );
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case RequestState.error:
                  return const Center(
                    child: Text('data'),
                  );
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
