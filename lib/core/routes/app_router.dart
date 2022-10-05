import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/blogs/presentation/screens/blogs_details.dart';
import '../../features/blogs/presentation/screens/blogs_screen.dart';

import '../../features/forums/presentation/screens/forums_screen.dart';
import '../constants/constants.dart';
import '../params/app_params.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutesNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutesNames.blogsScreen:
        return MaterialPageRoute(builder: (_) => const BlogsScreen());
      case AppRoutesNames.blogsScreenDetails:
        BlogsDetailsParams arguments = args as BlogsDetailsParams;
        return MaterialPageRoute(
            builder: (_) => BlogDetailes(arguments.blogDetailes,
                arguments.blogTitle, arguments.photoUrl));
      case AppRoutesNames.forumsScreen:
        return MaterialPageRoute(builder: (_) => const ForumsScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('no Routes'),
                  ),
                ));
    }
  }
}
