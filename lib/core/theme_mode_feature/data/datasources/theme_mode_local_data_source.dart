import 'package:la_vie_with_clean_architecture/core/cache/cache_helper.dart';
import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/cache_theme_mode.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/get_cache_theme_value.dart';

abstract class BaseThemeModeLocalDatasource {
  Future<bool> cacheThemeMode(ThemeModeCacheParams params);
  Future<bool> getcachedThemeMode(CacheThemeValueParams params);
}

class ThemeModeLocalDatasourceImpl extends BaseThemeModeLocalDatasource {
  @override
  Future<bool> cacheThemeMode(ThemeModeCacheParams params) async {
    try {
      final result =
          await CacheHelper.setData(key: 'ThemeMode', value: params.isDark);

      return result;
    } on Exception catch (exceptions) {
      throw CacheException(
          LocalErrorsMessageModel(errorMessage: exceptions.toString()));
    }
  }

  @override
  Future<bool> getcachedThemeMode(CacheThemeValueParams params) async {
    try {
      final result = await CacheHelper.getData(
        key: params.key,
      );

      return result;
    } on Exception catch (exceptions) {
      throw CacheException(
          LocalErrorsMessageModel(errorMessage: exceptions.toString()));
    }
  }
}
