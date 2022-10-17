import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';

Widget changeCardInformation({
  required BuildContext context,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p8),
    child: Card(
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: Icon(
          Icons.insert_drive_file_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    ),
  );
}
