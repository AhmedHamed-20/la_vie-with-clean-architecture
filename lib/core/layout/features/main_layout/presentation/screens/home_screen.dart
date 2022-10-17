import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/error_widget.dart';
import '../../../../../utl/utls.dart';
import '../bloc/main_layout_bloc.dart';
import '../widgets/main_layout_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutBloc, MainLayoutState>(
      builder: (context, state) {
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
              return const Scaffold(body: ErrorScreen());
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
}
