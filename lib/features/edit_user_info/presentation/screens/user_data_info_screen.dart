import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/constants/media_query_of_methods.dart';
import '../widgets/change_user_data_widget.dart';
import '../widgets/up_photo_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: SizedBox(
              height: MediaQueryOfMethods.getAppHeight(context) * 0.4,
              child: const UpPhotoWidget(),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: ChangeUserDataWidget(),
          ),
        ],
      ),
    );
  }
}
