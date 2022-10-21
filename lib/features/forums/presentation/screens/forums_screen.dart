import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utl/utls.dart';
import '../bloc/forums_bloc.dart';
import '../widgets/post_main_widget.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<ForumsBloc>()
        ..add(
          AllForumsEvent(accessToken: accessToken, userId: userId),
        )
        ..add(
          ForumsMeEvent(accessToken: accessToken, userId: userId),
        ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutesNames.postForumScreen);
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).iconTheme.color,
              )),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          title: Text(
            'Forums',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: BlocBuilder<ForumsBloc, ForumsState>(
          builder: (context, state) {
            switch (state.forumsRequestState) {
              case ForumsRequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ForumsRequestState.loaded:
                return const PostMainWidget();
              case ForumsRequestState.error:
                return Center(
                  child: Text(state.errorMessage ?? 'error'),
                );
            }
          },
        ),
      ),
    );
  }
}
