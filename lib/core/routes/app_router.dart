import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/core/params/app_params.dart';
import 'package:la_vie_with_clean_architecture/features/auth/presentation/screens/login_screen.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/presentation/screens/blogs_details.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/presentation/screens/blogs_screen.dart';

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
