import 'package:get_it/get_it.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/repositories/repositories_impl.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/repositories/auth_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/get_userdata_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/signUp_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/data/datasource/blogs_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/data/repositories/blogs_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/repositories/blogs_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/usecases/get_blogs_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/presentation/bloc/blogs_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/data/datasource/get_all_products_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/data/repositories/get_all_products_repositories_impl.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/repositories/products_repositories.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/usecases/get_all_products_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/presentation/bloc/all_products_bloc.dart';

final servicelocator = GetIt.instance;

class ServiceLocator {
  void init() {
    //Bloc
    servicelocator.registerFactory<AuthBloc>(
        () => AuthBloc(servicelocator(), servicelocator(), servicelocator()));
    servicelocator.registerFactory<AllProductsBloc>(
        () => AllProductsBloc(servicelocator()));
    servicelocator
        .registerFactory<BlogsBloc>(() => BlogsBloc(servicelocator()));
    //useCases
    servicelocator.registerLazySingleton(() => LoginUsecase(servicelocator()));
    servicelocator.registerLazySingleton(() => SignupUscase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => UserDataUsecase(servicelocator()));

    servicelocator
        .registerLazySingleton(() => AllProductsUseCase(servicelocator()));
    servicelocator.registerLazySingleton(() => BlogsUsecase(servicelocator()));

    //Repositories
    servicelocator.registerLazySingleton<AuthRepositories>(
        () => AuthRepositoriesImpl(servicelocator()));
    servicelocator.registerLazySingleton<AllProductsRepositories>(
        () => AllProductsRepositoriesImpl(servicelocator()));
    servicelocator.registerLazySingleton<BlogRepositories>(
        () => BlogsRepositoriesImpl(servicelocator()));
    //DataSource
    servicelocator.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => RemoteAuthDataSourceImpl());
    servicelocator.registerLazySingleton<BaseAllProductsRemoteDataSource>(
        () => AllProductRemoteDataSourceImpl());
    servicelocator.registerLazySingleton<BaseBlogsRemoteDataSource>(
        () => BlogsRemoteDataSourceImpl());
  }
}
