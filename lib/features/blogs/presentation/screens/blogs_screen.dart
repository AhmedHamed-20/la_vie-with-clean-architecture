import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/services/service_locator.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/tob_tab.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/presentation/bloc/blogs_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/utl/request_state.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<BlogsBloc>()
        ..add(
          const AllBlogsEvent(
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQwMjkwNC00MzMxLTRkOGEtODRmOC1hOGVkNjRjMjVmM2IiLCJpYXQiOjE2NjQ4MDU0NTQsImV4cCI6MTY2NDk3ODI1NH0.CcgqAsPi2nzMmCVa1WehkZGoceM18oW7LPCDbXcDKnE'),
        ),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<BlogsBloc, BlogsState>(
          builder: (context, state) {
            switch (state.blogsRequestState) {
              case BlogsRequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case BlogsRequestState.loaded:
                print(state.blogsEntitie!.plantEntitie);
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<BlogsBloc>()
                                  .add(TobTabsIndex(index));
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
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        itemCount: state.blogsEntitie!.plantEntitie.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: AppWidth.w10,
                              leading: SizedBox(
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r8),
                                  child: Image.network(
                                    state.blogsEntitie!.plantEntitie[index]
                                        .imageUrl,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 200,
                                  ),
                                ),
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    children: [Text('data')],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              case BlogsRequestState.error:
                return const Center(
                  child: Text('error'),
                );
            }
          },
        ),
      ),
    );
  }
}
