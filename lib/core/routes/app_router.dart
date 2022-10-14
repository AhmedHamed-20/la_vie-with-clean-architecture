import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/screens/home_screen.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/presentation/screens/user_data_info_screen.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/screens/products_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/blogs/presentation/screens/blogs_details.dart';
import '../../features/blogs/presentation/screens/blogs_screen.dart';
import '../../features/forums/presentation/screens/forums_screen.dart';
import '../../features/forums/presentation/screens/post_forum.dart';
import '../constants/constants.dart';
import '../params/app_params.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case AppRoutesNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutesNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutesNames.productsScreen:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      case AppRoutesNames.blogsScreen:
        return MaterialPageRoute(builder: (_) => const BlogsScreen());
      case AppRoutesNames.blogsScreenDetails:
        BlogsDetailsParams arguments = args as BlogsDetailsParams;
        return MaterialPageRoute(
            builder: (_) => BlogDetailes(arguments.blogDetailes,
                arguments.blogTitle, arguments.photoUrl));
      case AppRoutesNames.forumsScreen:
        return MaterialPageRoute(builder: (_) => const ForumsScreen());
      case AppRoutesNames.postForumScreen:
        return MaterialPageRoute(builder: (_) => const PostForumScreen());
      case AppRoutesNames.userProfileScreen:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());

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
