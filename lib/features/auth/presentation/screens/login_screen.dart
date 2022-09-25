import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:la_vie_with_clean_architecture/core/components/defaults.dart';
import 'package:la_vie_with_clean_architecture/core/services/service_locator.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/presentation/bloc/all_products_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utl/request_state.dart';
import '../bloc/bloc/auth_bloc_bloc.dart';
import '../text_fileds_controlers/textfiled_controlers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   top: -10,
            //   right: -10,
            //   child: Image.asset('assets/images/login_tree.png'),
            // ),
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
                  // Padding(
                  //   padding: const EdgeInsets.all(AppPadding.p16),
                  //   child: Center(
                  //     child: Image.asset(
                  //       'assets/images/logo.png',
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: AppHeight.h10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        defaultTextFormField(
                          width: double.infinity,
                          height: AppHeight.h46,
                          radius: AppRadius.r5,
                          context: context,
                          controller:
                              TextFormFieldControllers.emailLoginController,
                          title: 'email',
                        ),
                        const SizedBox(
                          height: AppHeight.h10,
                        ),
                        defaultTextFormField(
                          width: double.infinity,
                          height: AppHeight.h46,
                          radius: AppRadius.r5,
                          context: context,
                          controller:
                              TextFormFieldControllers.passwordLoginController,
                          title: 'password',
                        ),
                        const SizedBox(
                          height: AppHeight.h10,
                        ),
                        BlocBuilder<AllProductsBloc, AllProductsState>(
                          builder: (context, state) {
                            switch (state.requestState) {
                              case RequestState.idle:
                                return defaultButton(
                                  onPressed: () {
                                    context.read<AllProductsBloc>().add(
                                          const AllProductsEvent(
                                              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQwMjkwNC00MzMxLTRkOGEtODRmOC1hOGVkNjRjMjVmM2IiLCJpYXQiOjE2NjQxMTgxNjMsImV4cCI6MTY2NDI5MDk2M30.nYe8Dg-T6WTJzmmwNot1JtLYsz4-t5mGvfxs6hBRVNk'),
                                        );
                                  },
                                  buttonChild: Text(
                                    'Login',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  width: double.infinity,
                                  height: AppHeight.h46,
                                );

                              case RequestState.loading:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case RequestState.loaded:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case RequestState.error:
                                return const Center(
                                  child: Text('data'),
                                );
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: AppHeight.h1,
                                color: AppColors.dividerColorGrey,
                              ),
                            ),
                            Text(
                              ' or continue with ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: AppHeight.h1,
                                color: AppColors.dividerColorGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppHeight.h12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: -15,
            //   left: -15,
            //   child: RotationTransition(
            //       turns: const AlwaysStoppedAnimation(180 / 360),
            //       child: Image.asset('assets/images/login_tree.png')),
            // ),
          ],
        ),
      ),
    );
  }
}
