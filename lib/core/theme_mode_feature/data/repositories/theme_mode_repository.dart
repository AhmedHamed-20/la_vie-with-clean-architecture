import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/data/datasources/theme_mode_local_data_source.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/repositories/theme_mode_repository.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/cache_theme_mode.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/get_cache_theme_value.dart';

class ThemeModeRepositoryImpl extends ThemeModeRepository {
  final BaseThemeModeLocalDatasource baseThemeModeLocalDatasource;

  ThemeModeRepositoryImpl(this.baseThemeModeLocalDatasource);
  @override
  Future<Either<CacheFailure, bool>> cacheThemeMode(
      ThemeModeCacheParams params) async {
    try {
      final result = await baseThemeModeLocalDatasource.cacheThemeMode(params);
      return Right(result);
    } on CacheException catch (failures) {
      return Left(
          CacheFailure(message: failures.localErrorsMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<CacheFailure, bool>> getcachedThemeMode(
      CacheThemeValueParams params) async {
    try {
      final result =
          await baseThemeModeLocalDatasource.getcachedThemeMode(params);
      return Right(result);
    } on CacheException catch (failures) {
      return Left(
          CacheFailure(message: failures.localErrorsMessageModel.errorMessage));
    }
  }
}
