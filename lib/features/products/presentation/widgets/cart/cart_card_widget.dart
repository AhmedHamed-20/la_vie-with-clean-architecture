import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

Widget cartCardWidget({
  required BuildContext context,
  required String photoUrl,
  required Widget title,
  required Widget subTitle,
  required Widget moreSubTitle,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r5),
              ),
              child: Image.network(
                photoUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: AppWidth.w8,
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                subTitle,
                const SizedBox(
                  height: AppHeight.h8,
                ),
                moreSubTitle,
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
