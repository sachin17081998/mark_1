import 'package:ds_kit/colors/app_colors.dart';
import 'package:ds_kit/ds_kit.dart';
import 'package:flutter/material.dart';

import 'sizing/sizing.dart';
import 'spacing/spacing.dart';

/*
This will help in avoiding the boilerplate code while accessing DS properties
without this you will have to use below code to access theme in widget
MyColors myColors = Theme.of(context).extension<MyColors>()!;

with this extension on ThemeData, you can use
MyColors myColors = Theme.of(context).colors;
 */
extension DsThemeExtended on ThemeData {
  AppColors get colors => extension<AppColors>() ?? AppColors.light();
  AppText get textStyle => extension<AppText>() ?? AppText.main();
  
  Spacing get spacing => extension<Spacing>() ?? Spacing();
  
  Sizing get size => extension<Sizing>() ?? Sizing();
}
