import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(
            AppRadius.r5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p30),
          child: Column(
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                height: AppHeight.h8,
              ),
              Text(
                'Add Photo',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
