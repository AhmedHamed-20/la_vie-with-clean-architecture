import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';

import '../repositories/theme_mode_repository.dart';

class ThemeModaCacheUsecase extends UseCase<bool, ThemeModeCacheParams> {
  final ThemeModeRepository themeModeRepository;

  ThemeModaCacheUsecase(this.themeModeRepository);
  @override
  Future<Either<Failure, bool>> call(ThemeModeCacheParams params) async {
    return await themeModeRepository.cacheThemeMode(params);
  }
}

class ThemeModeCacheParams extends Equatable {
  final bool isDark;

  const ThemeModeCacheParams(this.isDark);

  @override
  List<Object?> get props => [isDark];
}
