import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../components/defaults.dart';
import '../constants/constants.dart';

class Error401Screen extends StatelessWidget {
  const Error401Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'your session has been expired, please logout and login again (:',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: AppHeight.h10,
        ),
        BlocConsumer<AllProductsBloc, AllProductsState>(
            listener: (context, state) {
          if (state.cacheCleared) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutesNames.loginScreen, (route) => false);
          }
        }, builder: (context, state) {
          return defaultButton(
              onPressed: () {
                context
                    .read<AllProductsBloc>()
                    .add(const LogoutEvent('cart', 'accessToken'));
              },
              buttonChild: Text(
                'Logout',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              width: AppWidth.w100,
              height: AppHeight.h46);
        })
      ],
    );
  }
}
