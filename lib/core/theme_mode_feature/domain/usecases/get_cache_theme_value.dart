import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/repositories/theme_mode_repository.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';

class CacheThemeValueUsecase extends UseCase<bool, CacheThemeValueParams> {
  final ThemeModeRepository themeModeRepository;

  CacheThemeValueUsecase(this.themeModeRepository);
  @override
  Future<Either<Failure, bool>> call(CacheThemeValueParams params) async {
    return await themeModeRepository.getcachedThemeMode(params);
  }
}

class CacheThemeValueParams extends Equatable {
  final String key;

  const CacheThemeValueParams(this.key);

  @override
  List<Object?> get props => [key];
}
