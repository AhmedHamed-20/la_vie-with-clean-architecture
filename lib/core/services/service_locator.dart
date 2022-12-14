import 'package:get_it/get_it.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/data/datasources/main_layout_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/data/repositories/main_layout_repository_impl.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/repositories/main_layout_repository.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/network_connection/network_connection_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/data/datasources/theme_mode_local_data_source.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/data/repositories/theme_mode_repository.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/repositories/theme_mode_repository.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/cache_theme_mode.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/get_cache_theme_value.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/cache_access_token.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/data/datasources/updated_user_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/data/repositories/updated_user_data_repository.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/repositories/updated_user_data_repository.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/usecases/update_user_data.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/presentation/bloc/user_info_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_comment_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_like.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/search_in_forums_by_name.dart';
import 'package:la_vie_with_clean_architecture/features/products/data/datasource/local_product_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/delete_product_from_database.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/domain/usecases/get_access_token_from_cache.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_all_products_from_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/insert_product_into_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/update_amount_database.dart';
import 'package:la_vie_with_clean_architecture/features/scan/data/datasources/product_by_id_remote_datasource.dart';
import 'package:la_vie_with_clean_architecture/features/scan/data/repositories/product_by_id_repository.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/repositories/product_by_id_repository.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/usecases/get_product_by_id.dart';
import 'package:la_vie_with_clean_architecture/features/scan/presentation/bloc/scan_bloc.dart';
import '../../features/forums/domain/usecases/post_new_forums.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/repositories_impl.dart';
import '../../features/auth/domain/repositories/auth_repositories.dart';
import '../../features/products/domain/usecases/clear_cache.dart';
import '../../features/products/domain/usecases/clear_user_database.dart';
import '../layout/features/main_layout/data/datasources/main_layout_local_datasource.dart';
import '../layout/features/main_layout/domain/usecases/get_userdata_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/signUp_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/blogs/data/datasource/blogs_remote_datasource.dart';
import '../../features/blogs/data/repositories/blogs_repositories.dart';
import '../../features/blogs/domain/repositories/blogs_repositories.dart';
import '../../features/blogs/domain/usecases/get_blogs_usecase.dart';
import '../../features/blogs/presentation/bloc/blogs_bloc.dart';
import '../../features/forums/data/datasources/forums_remote_datasource.dart';
import '../../features/forums/data/repositories/forums_repositories_impl.dart';
import '../../features/forums/domain/repositories/forums_repositories.dart';
import '../../features/forums/domain/usecases/get_all_forums.dart';
import '../../features/forums/domain/usecases/get_forums_me.dart';
import '../../features/forums/presentation/bloc/forums_bloc.dart';
import '../../features/products/data/datasource/get_all_products_remote_datasource.dart';
import '../../features/products/data/repositories/products_repositories_impl.dart';
import '../../features/products/domain/repositories/products_repositories.dart';
import '../../features/products/domain/usecases/get_all_products_usecase.dart';
import '../../features/products/presentation/bloc/all_products_bloc.dart';
import '../theme_mode_feature/presentation/bloc/theme_mode_bloc.dart';

final servicelocator = GetIt.instance;

class ServiceLocator {
  void init() {
    //Bloc
    servicelocator.registerFactory<ThemeModeBloc>(
        () => ThemeModeBloc(servicelocator(), servicelocator()));
    servicelocator.registerFactory<AuthBloc>(() => AuthBloc(
          servicelocator(),
          servicelocator(),
          servicelocator(),
        ));
    servicelocator.registerFactory<AllProductsBloc>(
      () => AllProductsBloc(
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator(),
      ),
    );
    servicelocator
        .registerFactory<BlogsBloc>(() => BlogsBloc(servicelocator()));
    servicelocator.registerFactory<ForumsBloc>(() => ForumsBloc(
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator(),
        servicelocator()));
    servicelocator.registerFactory<UserInfoBloc>(() => UserInfoBloc(
          servicelocator(),
        ));
    servicelocator.registerFactory<MainLayoutBloc>(
        () => MainLayoutBloc(servicelocator(), servicelocator()));
    servicelocator
        .registerFactory<NetworkConnectionBloc>(() => NetworkConnectionBloc());
    servicelocator.registerFactory<ScanBloc>(() => ScanBloc(servicelocator()));

    //useCases

    servicelocator.registerLazySingleton(() => LoginUsecase(servicelocator()));
    servicelocator.registerLazySingleton(() => SignupUscase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => UserDataUsecase(servicelocator()));

    servicelocator
        .registerLazySingleton(() => AllProductsUseCase(servicelocator()));
    servicelocator.registerLazySingleton(() => BlogsUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => AllForumsUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => ForumsMeUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => ForumsPostUscase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => ProductDeletionFromDatabaseByIdUsecase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => ProductsInsertionIntoDatabaseUsecase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => PeroductsFromDatabaseUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => UpdateUserDataUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => AccessTokenCacheUsecase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => AccessTokenFromCacheUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => CacheClearUsecase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => UserCartDataBaseClearUsecase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => AmountUpdateInDataBaseUsecase(servicelocator()));

    servicelocator
        .registerLazySingleton(() => LikeAddUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => CommentsAddingUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => ProductByIdUsecase(servicelocator()));
    servicelocator.registerLazySingleton(
        () => ForumsSearchByTitleUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => ThemeModaCacheUsecase(servicelocator()));
    servicelocator
        .registerLazySingleton(() => CacheThemeValueUsecase(servicelocator()));
    //Repositories
    servicelocator.registerLazySingleton<AuthRepositories>(
        () => AuthRepositoriesImpl(servicelocator(), servicelocator()));
    servicelocator.registerLazySingleton<AllProductsRepositories>(
        () => AllProductsRepositoriesImpl(servicelocator(), servicelocator()));
    servicelocator.registerLazySingleton<BlogRepositories>(
        () => BlogsRepositoriesImpl(servicelocator()));
    servicelocator.registerLazySingleton<ForumsRepositories>(
        () => ForumsRepositoriesImpl(servicelocator()));
    servicelocator.registerLazySingleton<UpdatedUserDataRepository>(
        () => UpdatedUserDataRepositoryImpl(servicelocator()));
    servicelocator.registerLazySingleton<MainLayoutRepository>(
        () => MainLayoutRepositoryImpl(servicelocator(), servicelocator()));
    servicelocator.registerLazySingleton<ProductByIdRepository>(
        () => ProductByIdRepositoryImpl(servicelocator()));
    servicelocator.registerLazySingleton<ThemeModeRepository>(
        () => ThemeModeRepositoryImpl(servicelocator()));
    //DataSource
    servicelocator.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => RemoteAuthDataSourceImpl());
    servicelocator.registerLazySingleton<BaseAuthLocalDataSource>(
        () => AuthLocalDataSourceImpl());
    servicelocator.registerLazySingleton<BaseAllProductsRemoteDataSource>(
        () => AllProductRemoteDataSourceImpl());
    servicelocator.registerLazySingleton<BaseBlogsRemoteDataSource>(
        () => BlogsRemoteDataSourceImpl());
    servicelocator.registerLazySingleton<BaseForumsRemoteDatesource>(
        () => AllForumsRemoteDatasource());
    servicelocator.registerLazySingleton<BaseAllProductsLocalDataSource>(
        () => AllProductLocalDataSourceImpl());
    servicelocator.registerLazySingleton<BaseUpdatedUserRemoteDatasource>(
        () => UpdatedUserDataRemoteDataSourceImpl());
    servicelocator.registerLazySingleton<BaseMainLayoutRemoteDataSource>(
        () => MainLayoutRemoteDataSourceImpl());
    servicelocator.registerLazySingleton<BaseMainLayoutLocalDataSource>(
        () => MainLayoutLocalDataSourceImpl());
    servicelocator.registerLazySingleton<BaseProductByIdRemoteDataSource>(
        () => ProductByIdRemoteDataSourceImpl());
    servicelocator.registerLazySingleton<BaseThemeModeLocalDatasource>(
        () => ThemeModeLocalDatasourceImpl());
  }
}
