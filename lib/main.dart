import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/theme/app_theme.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/usecases/get_blogs_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/presentation/screens/blogs_screen.dart';

import 'core/services/service_locator.dart';
import 'features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/get_products/presentation/bloc/all_products_bloc.dart';

void main() {
  ServiceLocator().init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => servicelocator<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => servicelocator<AllProductsBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        home: const BlogsScreen(),
      ),
    );
  }
}
