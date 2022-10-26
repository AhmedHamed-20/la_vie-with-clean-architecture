import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/media_query_of_methods.dart';
import 'package:la_vie_with_clean_architecture/core/network_connection/network_connection_bloc.dart';
import '../../../../core/layout/features/main_layout/presentation/screens/no_internet_connection_screen.dart';
import '../../../../core/services/service_locator.dart';
import '../bloc/user_info_bloc.dart';
import '../widgets/change_user_data_widget.dart';
import '../widgets/up_photo_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<UserInfoBloc>(),
      child: BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
          builder: (context, internetConnectionState) {
        if (internetConnectionState.isConnected == false) {
          return const NoInternetConnectionScreen();
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.black.withOpacity(0.8),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      height: MediaQueryOfMethods.getAppHeight(context) * 0.4,
                      child: const UpPhotoWidget(),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: ChangeUserDataWidget(),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
