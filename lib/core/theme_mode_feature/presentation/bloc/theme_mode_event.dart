part of 'theme_mode_bloc.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();
}

class ChangeThemeModeEvent extends ThemeModeEvent {
  final ThemeData currentTheme;

  const ChangeThemeModeEvent(this.currentTheme);
  @override
  List<Object?> get props => [currentTheme];
}

class CacheThemeModeEvent extends ThemeModeEvent {
  final bool isDark;

  const CacheThemeModeEvent(this.isDark);

  @override
  List<Object?> get props => [isDark];
}

class GetCacheThemeValueEvent extends ThemeModeEvent {
  final String key;

  const GetCacheThemeValueEvent(this.key);

  @override
  List<Object?> get props => [key];
}
