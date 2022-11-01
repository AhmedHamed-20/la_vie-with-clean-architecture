import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/tob_tab.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/service_locator.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_widgets/login_widget.dart';
import '../widgets/sign_up_widgets/sign_up_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => servicelocator<AuthBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -10,
                right: -10,
                child: Image.asset('assets/images/login_tree.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      child: Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r10)),
                          color: Theme.of(context).backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p10),
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppHeight.h10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: BlocBuilder<AuthBloc, AuthBlocState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<AuthBloc>(context).add(
                                          CurrentActiveTabIndexEvent(index));
                                    },
                                    child: TobTabs(
                                      tabs: const ['SignUp', 'Login'],
                                      currentActiveTab: state.currentActiveTab,
                                      currentWidgetIndex: index,
                                      context: context,
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                    BlocBuilder<AuthBloc, AuthBlocState>(
                      builder: (context, state) {
                        if (state.currentActiveTab == 0) {
                          return const SignUpWidget();
                        } else {
                          return const LoginWidget();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -15,
                left: -15,
                child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(180 / 360),
                    child: Image.asset('assets/images/login_tree.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
