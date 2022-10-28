import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';

import '../../bloc/all_products_bloc.dart';
import 'buy_success_alert_dialog.dart';

class AskAboutBuyingAlertDialog extends StatelessWidget {
  const AskAboutBuyingAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r16)),
      scrollable: true,
      content: Center(
        child: Text(
          'Buy this products ?',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context
                .read<AllProductsBloc>()
                .add(const CartDataClearEvent('cart'));

            showDialog(
                context: context,
                builder: (context) {
                  return const BuySuccessAlertDialog();
                });
          },
          child: Text(
            'Yes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'No',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
