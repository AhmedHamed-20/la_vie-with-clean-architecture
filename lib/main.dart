import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/constants.dart';
import 'core/network/dio.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/blogs/domain/usecases/get_blogs_usecase.dart';
import 'features/blogs/presentation/screens/blogs_screen.dart';

import 'core/services/service_locator.dart';
import 'features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/get_products/presentation/bloc/all_products_bloc.dart';

void main() {
  ServiceLocator().init();
  DioHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
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
        onGenerateRoute: appRouter.generateRoutes,
        initialRoute: AppRoutesNames.forumsScreen,
      ),
    );
  }
}
