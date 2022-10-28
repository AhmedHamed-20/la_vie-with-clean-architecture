import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:lottie/lottie.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutBloc, MainLayoutState>(
      builder: (context, state) {
        if (state.userDataEntitie?.userNotification == [] ||
            state.userDataEntitie!.userNotification.isEmpty) {
          return Column(
            children: [
              Center(
                child: Lottie.asset('assets/images/notifications.json'),
              ),
              Center(
                child: Text(
                  'You have no notifications',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      state.userDataEntitie!.userNotification[index].imageUrl)),
              title:
                  Text(state.userDataEntitie!.userNotification[index].message),
              subtitle: Text(
                DateTimeFormat.format(
                    DateTime.parse(
                      state.userDataEntitie!.userNotification[index].createdAt,
                    ),
                    format: 'D, M j, H:i'),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            );
          },
          itemCount: state.userDataEntitie?.userNotification.length,
        );
      },
    );
  }
}
