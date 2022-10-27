import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/defaults.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/core/network_connection/network_connection_bloc.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/no_internet.json',
            ),
          ),
          Center(
            child: Text(
              'No Internet connection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
            builder: (context, state) {
              return defaultButton(
                  onPressed: () {
                    context
                        .read<NetworkConnectionBloc>()
                        .add(const CheckInternetConnectionEvent());
                  },
                  buttonChild: Text(
                    'Retry',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  width: AppWidth.w100,
                  height: AppHeight.h46);
            },
          ),
        ],
      ),
    );
  }
}
