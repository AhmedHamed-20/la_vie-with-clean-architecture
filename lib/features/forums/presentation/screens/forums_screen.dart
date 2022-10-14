import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';

import '../../../../core/services/service_locator.dart';
import '../bloc/forums_bloc.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<ForumsBloc>()
        ..add(
          ForumsMeEvent(
            accessToken: accessToken,
          ),
        )
        ..add(
          ForumsMeEvent(
            accessToken: accessToken,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forums'),
        ),
        body: Center(
          child: BlocBuilder<ForumsBloc, ForumsState>(
            builder: (context, state) {
              return const Text('Forums');
            },
          ),
        ),
      ),
    );
  }
}
