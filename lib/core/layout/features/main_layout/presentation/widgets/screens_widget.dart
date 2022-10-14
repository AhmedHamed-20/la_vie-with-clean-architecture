import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/screens/notifications_screen.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/presentation/screens/blogs_screen.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/presentation/screens/user_data_info_screen.dart';
import 'package:la_vie_with_clean_architecture/features/forums/presentation/screens/forums_screen.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/screens/products_screen.dart';

List<Widget> mainScreens = [
  const BlogsScreen(),
  const ForumsScreen(),
  const ProductsScreen(),
  const NotificationsScreen(),
  const UserProfileScreen(),
];
