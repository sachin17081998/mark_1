import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static const _black = Color(0xff131313);
  static const _red = Color(0xffff0505);
  static const _white = Color(0xffffffff);
  static const _secondaryBlack = Color(0xff484848);
  static const _secondaryWhite = Color.fromARGB(255, 240, 236, 236);

  ///[primary] main color of the app to highlight subject
  ///[secondary] color to highlight main details of the subject
  ///[tertiary] color to highlight sub details of the subject
  ///[background] app background color
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color background;

  const AppColors._internal({
    required this.primary,
    required this.background,
    required this.secondary,
    required this.tertiary,
  });

  factory AppColors.dark() {
    return const AppColors._internal(
        primary: _red,
        background: _black,
        secondary: _white,
        tertiary: _secondaryWhite);
  }

  factory AppColors.light() {
    return const AppColors._internal(
        primary: _red,
        background: _white,
        secondary: _black,
        tertiary: _secondaryBlack);
  }

  @override
  ThemeExtension<AppColors> copyWith({bool? darkMode}) {
    if (darkMode == null || darkMode) {
      return AppColors.dark();
    }

    return AppColors.light();
  }

  // for linear interploation b/w two objects
  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors._internal(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
