import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../../../../core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';

class UserProfileAlertDialogWidget extends StatelessWidget {
  const UserProfileAlertDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainLayoutBloc = BlocProvider.of<MainLayoutBloc>(context);
    return BlocConsumer<AllProductsBloc, AllProductsState>(
      listener: (context, state) {
        if (state.cacheCleared) {
          mainLayoutBloc.add(BackToinitialEvent());
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutesNames.loginScreen, (route) => false);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r16)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    context
                        .read<AllProductsBloc>()
                        .add(const LogoutEvent('cart', 'accessToken'));
                  },
                  child: Text(
                    'Yes',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ],
          title: Text(
            'Are Your Sure ?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            'You want to logout ?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }
}
