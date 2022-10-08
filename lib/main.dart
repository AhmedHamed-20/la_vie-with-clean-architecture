import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/constants.dart';
import 'core/network/dio.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'features/products/presentation/bloc/all_products_bloc.dart';

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
          create: (context) => servicelocator<AuthBloc>()
            ..add(const GetUserDataEvent(
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzQwMjkwNC00MzMxLTRkOGEtODRmOC1hOGVkNjRjMjVmM2IiLCJpYXQiOjE2NjUyNjE2NjAsImV4cCI6MTY2NTQzNDQ2MH0.tddFPf9aPxYvMH9IKC3lySkJav1nUwmKLGSc3t1bg2s')),
        ),
        BlocProvider(
          create: (context) => servicelocator<AllProductsBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        onGenerateRoute: appRouter.generateRoutes,
        initialRoute: AppRoutesNames.userProfileScreen,
      ),
    );
  }
}
