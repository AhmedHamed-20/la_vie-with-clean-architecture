import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
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
          const AllBlogsEvent(
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQwMjkwNC00MzMxLTRkOGEtODRmOC1hOGVkNjRjMjVmM2IiLCJpYXQiOjE2NjQ5MjMxMjEsImV4cCI6MTY2NTA5NTkyMX0.Ki-V2wepIiRwJ-oazru800Ci-radI3jHPP-gn7IZWWY'),
        ),
      child: Scaffold(
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
              color: AppColors.iconColorGrey,
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
