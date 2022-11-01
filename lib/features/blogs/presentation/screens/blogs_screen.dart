import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/defaults.dart';
import 'package:la_vie_with_clean_architecture/core/network_connection/network_connection_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/widgets/error_401_widget.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/layout/features/main_layout/presentation/screens/no_internet_connection_screen.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utl/utls.dart';
import '../bloc/blogs_bloc.dart';
import '../widgets/products_blogs.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<BlogsBloc>()
        ..add(
          AllBlogsEvent(savedaccessToken),
        ),
      child: BlocBuilder<NetworkConnectionBloc, NetworkConnectionState>(
          builder: (context, internetConnectionState) {
        if (internetConnectionState.isConnected == false) {
          return const NoInternetConnectionScreen();
        } else {
          var blogsBloc = BlocProvider.of<BlogsBloc>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Blogs',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: AppColors.transparentColor,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: BlocBuilder<BlogsBloc, BlogsState>(
              builder: (context, state) {
                switch (state.blogsRequestState) {
                  case BlogsRequestState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case BlogsRequestState.loaded:
                    return const ProductsBlogs();
                  case BlogsRequestState.error:
                    if (state.errorMessage == 'Unauthorized') {
                      return const Error401Screen();
                    } else {
                      return Column(
                        children: [
                          Center(
                            child: Text(state.errorMessage),
                          ),
                          defaultButton(
                              onPressed: () {
                                blogsBloc.add(
                                  AllBlogsEvent(savedaccessToken),
                                );
                              },
                              buttonChild: Text(
                                'Retry',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              width: AppWidth.w44,
                              height: AppHeight.h46),
                        ],
                      );
                    }
                }
              },
            ),
          );
        }
      }),
    );
  }
}
