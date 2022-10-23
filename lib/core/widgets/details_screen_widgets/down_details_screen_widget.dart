import 'package:flutter/material.dart';

import '../../components/defaults.dart';
import '../../constants/constants.dart';

class DownDetailsScreenWidget extends StatelessWidget {
  const DownDetailsScreenWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.additiontalDescription,
  }) : super(key: key);

  final String title;
  final String description;
  final String? additiontalDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            AppRadius.r22,
          ),
          topRight: Radius.circular(
            AppRadius.r22,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p6),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: AppFontSize.s20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p6),
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p6),
                      child: Text(
                        additiontalDescription ??
                            'Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: defaultButton(
                onPressed: () {},
                buttonChild: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Text(
                    'Go To Blog',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
