import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/cache/cache_helper.dart';
import 'package:la_vie_with_clean_architecture/core/database/database_setup.dart';

import 'core/constants/constants.dart';
import 'core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'core/network/dio.dart';
import 'core/network_connection/network_connection_bloc.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/edit_user_info/presentation/bloc/user_info_bloc.dart';
import 'features/products/presentation/bloc/all_products_bloc.dart';

void main() async {
  // internetConnectionStatus.listOnConnection();
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await DioHelper.init();
  await CacheHelper.init();
  await DatabaseProvider.init(
      databasesName: 'cart.db',
      version: 1,
      query:
          '''CREATE TABLE cart (id INTEGER PRIMARY KEY,productId TEXT,translation TEXT,name TEXT,description TEXT,imageUrl TEXT,price INTEGER,amount INTEGER)''');
  final String accessToken =
      await CacheHelper.getData(key: 'accessToken') ?? '';
  runApp(MyApp(
    accessToken: accessToken,
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
    required this.accessToken,
  }) : super(key: key);
  final String accessToken;
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => servicelocator<MainLayoutBloc>()
                ..add(const GetAccessTokenFromCacheEvent('accessToken'))),
          BlocProvider(
            create: (context) => servicelocator<AllProductsBloc>()
              ..add(const AllProductsFromDatabaseEvent('cart')),
          ),
          BlocProvider(create: (context) => servicelocator<AuthBloc>()),
          BlocProvider(create: (context) => servicelocator<UserInfoBloc>()),
          BlocProvider(
              create: (context) => servicelocator<NetworkConnectionBloc>()
                ..add(const CheckInternetConnectionEvent())),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: lightMode,
            onGenerateRoute: appRouter.generateRoutes,
            initialRoute: accessToken == ''
                ? AppRoutesNames.loginScreen
                : AppRoutesNames.homeScreen));
  }
}
