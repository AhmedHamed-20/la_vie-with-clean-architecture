import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/error_401_widget.dart';
import '../../../../../network_connection/network_connection_bloc.dart';
import '../../../../../utl/utls.dart';
import '../bloc/main_layout_bloc.dart';
import '../widgets/main_layout_widget.dart';
import 'no_internet_connection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
      builder: (context, networkState) {
        return BlocBuilder<MainLayoutBloc, MainLayoutState>(
          builder: (context, state) {
            if (networkState.isConnected == false) {
              return const NoInternetConnectionScreen();
            }
            switch (state.userDataRequestState) {
              case UserDataRequestState.loading:
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case UserDataRequestState.accessTokenGetSuccess:
                context
                    .read<MainLayoutBloc>()
                    .add(GetUserDataEvent(state.accessToken));
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
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
      },
    );
  }
}
