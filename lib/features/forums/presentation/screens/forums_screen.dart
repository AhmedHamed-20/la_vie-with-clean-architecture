import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';

import '../bloc/forums_bloc.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicelocator<ForumsBloc>()
        ..add(const AllForumsEvent(
            accessToken:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQwMjkwNC00MzMxLTRkOGEtODRmOC1hOGVkNjRjMjVmM2IiLCJpYXQiOjE2NjQ5MjMxMjEsImV4cCI6MTY2NTA5NTkyMX0.Ki-V2wepIiRwJ-oazru800Ci-radI3jHPP-gn7IZWWY')),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forums'),
        ),
        body: Center(
          child: BlocBuilder<ForumsBloc, ForumsState>(
            builder: (context, state) {
              print(state.allForumsEntitie);
              return const Text('Forums');
            },
          ),
        ),
      ),
    );
  }
}
