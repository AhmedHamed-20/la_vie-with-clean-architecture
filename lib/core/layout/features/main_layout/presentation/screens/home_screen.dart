import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/error_401_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../../../network_connection/network_connection_bloc.dart';
import '../../../../../utl/utls.dart';
import '../bloc/main_layout_bloc.dart';
import '../widgets/main_layout_widget.dart';
import 'no_internet_connection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<MainLayoutBloc>(context)
        .add(const GetAccessTokenFromCacheEvent('accessToken'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
        builder: (context, networkState) {
      if (networkState.isConnected == false) {
        return const NoInternetConnectionScreen();
      } else {
        return BlocConsumer<MainLayoutBloc, MainLayoutState>(
          listener: (context, state) {
            if (state.accessToken.isNotEmpty) {}
          },
          builder: (context, state) {
            switch (state.userDataRequestState) {
              case UserDataRequestState.loading:
                return Scaffold(
                  body: Center(
                    child: Lottie.asset('assets/images/loading.json'),
                  ),
                );
              case UserDataRequestState.accessTokenGetSuccess:
                context
                    .read<MainLayoutBloc>()
                    .add(GetUserDataEvent(state.accessToken));
                return Scaffold(
                  body: Center(
                    child: Lottie.asset('assets/images/loading.json'),
                  ),
                );
              case UserDataRequestState.loaded:
                return const MainLayoutWidget();
              case UserDataRequestState.error:
                if (state.statusCode == 401) {
                  return const Scaffold(body: Error401Screen());
                }
                return Scaffold(
                  body: Center(
                    child: Text(state.mainLayoutErrorMessage),
                  ),
                );
            }
          },
        );
      }
    });
  }
}
