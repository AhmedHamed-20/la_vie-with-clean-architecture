import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class PostUserInfoRowWidget extends StatelessWidget {
  const PostUserInfoRowWidget(
      {Key? key,
      required this.forumsUserImage,
      required this.forumsUserFirstName,
      required this.forumsUserLastName})
      : super(key: key);
  final String forumsUserImage;
  final String forumsUserFirstName;
  final String forumsUserLastName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
            filterQuality: FilterQuality.low,
            width: 50,
            height: 50,
            imageBuilder: (context, imageprovider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageprovider, fit: BoxFit.cover),
                  ),
                ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: forumsUserImage,
            errorWidget: (context, url, error) {
              return const Center(
                child: Text('no image...'),
              );
            }),
        const SizedBox(
          width: AppWidth.w8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$forumsUserFirstName $forumsUserLastName',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '2 days ago',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ],
    );
  }
}
