import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/defaults.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/core/network_connection/network_connection_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/text_fileds_controlers/textfiled_controlers.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/error_401_widget.dart';

import '../../../../core/layout/features/main_layout/presentation/screens/no_internet_connection_screen.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utl/utls.dart';
import '../bloc/forums_bloc.dart';
import '../widgets/main_posts_widgets/post_main_widget.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<ForumsBloc>()
        ..add(
          AllForumsEvent(accessToken: savedaccessToken, userId: userId),
        )
        ..add(
          ForumsMeEvent(accessToken: savedaccessToken, userId: userId),
        ),
      child: BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
          builder: (context, internetConnectionState) {
        if (internetConnectionState.isConnected == false) {
          return const NoInternetConnectionScreen();
        } else {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r16),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).primaryColor)),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutesNames.postForumScreen);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.iconColorWhite,
                      )),
                ),
              ],
              leading: IconButton(
                  onPressed: () {
                    TextFormFieldControllers.forumsSearchController.clear();
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).iconTheme.color,
                  )),
              elevation: 0,
              backgroundColor: AppColors.transparentColor,
              title: Text(
                'Forums',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: BlocBuilder<ForumsBloc, ForumsState>(
              builder: (context, state) {
                switch (state.forumsRequestState) {
                  case ForumsRequestState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ForumsRequestState.loaded:
                    return const PostMainWidget();
                  case ForumsRequestState.error:
                    //because the fkn backend sometime did not send status code
                    if (state.errorMessage == 'Unauthorized') {
                      return const Error401Screen();
                    } else {
                      return Column(
                        children: [
                          Center(
                            child: Text(state.errorMessage ?? 'error'),
                          ),
                          defaultButton(
                              onPressed: () {
                                context.read<ForumsBloc>()
                                  ..add(
                                    AllForumsEvent(
                                        accessToken: savedaccessToken,
                                        userId: userId),
                                  )
                                  ..add(
                                    ForumsMeEvent(
                                        accessToken: savedaccessToken,
                                        userId: userId),
                                  );
                              },
                              buttonChild: const Text('Retry'),
                              width: AppWidth.w44,
                              height: AppHeight.h46),
                        ],
                      );
                    }
                }
              },
            ),
          );
        }
      }),
    );
  }
}
