import 'package:flutter/material.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';

class TitleAndDescriptionWidgets extends StatelessWidget {
  const TitleAndDescriptionWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        defaultTextFormField(
          width: double.infinity,
          height: AppHeight.h70,
          radius: AppRadius.r5,
          context: context,
          controller: TextFormFieldControllers.titlePostController,
        ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        Text(
          'Description',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        defaultTextFormField(
          maxLine: 6,
          width: double.infinity,
          height: AppHeight.h130,
          radius: AppRadius.r5,
          context: context,
          controller: TextFormFieldControllers.descriptionPostController,
        ),
      ],
    );
  }
}
