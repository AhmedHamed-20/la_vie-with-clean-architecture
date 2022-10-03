import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/tob_tab.dart';
import '../bloc/blogs_bloc.dart';

class ProductsBlogs extends StatelessWidget {
  const ProductsBlogs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsBloc, BlogsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.1,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<BlogsBloc>().add(TobTabsIndex(index));
                    },
                    child: TobTabs(
                      tabs: const ['Plants', 'Seeds', 'Tools'],
                      currentActiveTab: state.currentActiveTab,
                      currentWidgetIndex: index,
                      context: context,
                    ),
                  );
                },
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.activeEntitie!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Row(
                          children: [
                            Flexible(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      state.activeEntitie![index].imageUrl,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: AppWidth.w10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2 days ago',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    state.activeEntitie![index].name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    state.activeEntitie![index].description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
