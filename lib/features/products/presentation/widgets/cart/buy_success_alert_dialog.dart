import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/constants.dart';

class BuySuccessAlertDialog extends StatelessWidget {
  const BuySuccessAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Center(
        child: Text(
          'Success',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r16)),
      actions: [
        Center(
            child: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'ok',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ))
      ],
      content: Column(
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/success.json',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
