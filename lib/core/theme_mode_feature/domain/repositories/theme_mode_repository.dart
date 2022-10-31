import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/cache_theme_mode.dart';

import '../usecases/get_cache_theme_value.dart';

abstract class ThemeModeRepository {
  Future<Either<CacheFailure, bool>> cacheThemeMode(
      ThemeModeCacheParams params);
  Future<Either<CacheFailure, bool>> getcachedThemeMode(
      CacheThemeValueParams params);
}
