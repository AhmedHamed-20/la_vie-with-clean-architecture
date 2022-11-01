import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';
import 'package:lottie/lottie.dart';

import '../components/defaults.dart';
import '../constants/constants.dart';

class Error401Screen extends StatelessWidget {
  const Error401Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allProductBloc = BlocProvider.of<AllProductsBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/images/loading.json'),
        ),
        const SizedBox(
          width: AppWidth.w8,
        ),
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
                allProductBloc.add(const LogoutEvent('cart', 'accessToken'));
              },
              buttonChild: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.white),
              ),
              width: AppWidth.w100,
              height: AppHeight.h46);
        })
      ],
    );
  }
}
