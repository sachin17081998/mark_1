import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static const _black = Color(0xff070707);
  static const _green = Color(0xff7fd4bc);
  static const _white = Color(0xfffeffff);
  // static const _green100 = Color(0xff7ed3bb);
  static const _green200 = Color(0xff6c8a82);

  final Color primaryBackground;
  final Color onPrimaryBackground;
  final Color secondary;
  final Color tertiary;

  const AppColors._internal({
    required this.primaryBackground,
    required this.onPrimaryBackground,
    required this.secondary,
    required this.tertiary,
  });

  factory AppColors.dark() {
    return const AppColors._internal(
        primaryBackground: _black,
        onPrimaryBackground: _white,
        secondary: _green,
        tertiary: _green200);
  }

  factory AppColors.light() {
    return const AppColors._internal(
        primaryBackground: _white,
        onPrimaryBackground: _black,
        secondary: _green,
        tertiary: _green200);
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
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t)!,
      onPrimaryBackground:
          Color.lerp(onPrimaryBackground, other.onPrimaryBackground, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
