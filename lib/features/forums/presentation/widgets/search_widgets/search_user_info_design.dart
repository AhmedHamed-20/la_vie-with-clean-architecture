import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../bloc/forums_bloc.dart';

class SearchUserInfoRowDesign extends StatelessWidget {
  const SearchUserInfoRowDesign({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumsBloc, ForumsState>(
      builder: (context, state) {
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
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl:
                    state.searchForumsEntitie[index].forumsUserEntitie.imageUrl,
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
                  '${state.searchForumsEntitie[index].forumsUserEntitie.firstName} ${state.searchForumsEntitie[index].forumsUserEntitie.lastName}',
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
      },
    );
  }
}
