part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {
  final String errorMessage;
  final ThemeModeValue themeModeValue;
  final bool isCached;

  const ThemeModeState(
      {this.errorMessage = '',
      this.isCached = false,
      this.themeModeValue = ThemeModeValue.light});
  ThemeModeState copyWith({
    String? errorMessage,
    bool? isCached,
    ThemeModeValue? themeModeValue,
  }) {
    return ThemeModeState(
        errorMessage: errorMessage ?? this.errorMessage,
        isCached: isCached ?? this.isCached,
        themeModeValue: themeModeValue ?? this.themeModeValue);
  }

  @override
  List<Object> get props => [themeModeValue, isCached, errorMessage];
}
