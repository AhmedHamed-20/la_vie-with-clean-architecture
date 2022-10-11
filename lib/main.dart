import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/cache/cache_helper.dart';

import 'core/constants/constants.dart';
import 'core/network/dio.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/products/presentation/bloc/all_products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await DioHelper.init();
  await CacheHelper.init();
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
        BlocProvider(create: (context) => servicelocator<AuthBloc>()),
        BlocProvider(
          create: (context) => servicelocator<AllProductsBloc>()
            ..add(const GetAccessTokenFromCacheEvent('accessToken')),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        onGenerateRoute: appRouter.generateRoutes,
        initialRoute: accessToken == ''
            ? AppRoutesNames.loginScreen
            : AppRoutesNames.homeScreen,
      ),
    );
  }
}
