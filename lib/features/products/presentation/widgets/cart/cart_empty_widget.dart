import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Image.asset('assets/images/card_empty.png'),
        const SizedBox(
          height: AppHeight.h8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppFontSize.s20,
                ),
          ),
        ),
        const SizedBox(
          height: AppHeight.h4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Text(
            'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: AppFontSize.s18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
