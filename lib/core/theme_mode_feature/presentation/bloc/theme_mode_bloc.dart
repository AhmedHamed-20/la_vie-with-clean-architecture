import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/core/theme/app_theme.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/cache_theme_mode.dart';
import 'package:la_vie_with_clean_architecture/core/theme_mode_feature/domain/usecases/get_cache_theme_value.dart';

import '../../../utl/utls.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc(this.themeModaCacheUsecase, this.cacheThemeValueUsecase)
      : super(const ThemeModeState()) {
    on<ChangeThemeModeEvent>(_changeTheme);
    on<CacheThemeModeEvent>(_cacheThemeMode);
    on<GetCacheThemeValueEvent>(_getCacheThemeValue);
  }

  ThemeModaCacheUsecase themeModaCacheUsecase;
  CacheThemeValueUsecase cacheThemeValueUsecase;

  FutureOr<void> _changeTheme(
      ChangeThemeModeEvent event, Emitter<ThemeModeState> emit) {
    event.currentTheme == ThemeDataValue.lightMode
        ? emit(state.copyWith(themeModeValue: ThemeModeValue.light))
        : emit(state.copyWith(themeModeValue: ThemeModeValue.dark));
  }

  FutureOr<void> _cacheThemeMode(
      CacheThemeModeEvent event, Emitter<ThemeModeState> emit) async {
    final result =
        await themeModaCacheUsecase(ThemeModeCacheParams(event.isDark));

    result.fold(
        (l) => state.copyWith(
              errorMessage: l.message,
              isCached: false,
            ),
        (r) => state.copyWith(
              isCached: true,
            ));
  }

  FutureOr<void> _getCacheThemeValue(
      GetCacheThemeValueEvent event, Emitter<ThemeModeState> emit) async {
    final result =
        await cacheThemeValueUsecase(CacheThemeValueParams(event.key));
    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message,
            themeModeValue: ThemeModeValue.light)), (r) {
      if (r) {
        return emit(state.copyWith(themeModeValue: ThemeModeValue.dark));
      } else {
        return emit(state.copyWith(themeModeValue: ThemeModeValue.light));
      }
    });
  }
}
