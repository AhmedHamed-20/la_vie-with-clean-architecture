import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../../../../core/utl/utls.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<AllProductsBloc, AllProductsState>(
            builder: (context, state) {
              switch (state.requestState) {
                case AllProductsRequestState.idle:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AllProductsRequestState.accessTokenGetSuccess:
                  accessToken = state.accessToken;
                  context
                      .read<AllProductsBloc>()
                      .add(GetUserDataEvent(accessToken));
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AllProductsRequestState.userDataGetSuccess:
                  context.read<AllProductsBloc>().add(
                        AllProductsEvent(
                          accessToken,
                        ),
                      );
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AllProductsRequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AllProductsRequestState.loaded:
                  return const Center(
                    child: Text('alll Data Get Success'),
                  );
                case AllProductsRequestState.error:
                  return const Center(
                    child: Text('error'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
