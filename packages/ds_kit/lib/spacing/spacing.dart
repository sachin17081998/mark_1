import 'dart:ui';

import 'package:flutter/material.dart' as flutter;
import './spacing_tokens.dart';

class Spacing extends flutter.ThemeExtension<Spacing> {
  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s8;
  final double s12;
  final double s16;
  final double s20;
  final double s24;
  final double s28;
  final double s32;
  final double s36;
  final double s40;
  final double s44;
  final double s48;
  final double s52;
  final double s56;
  final double s60;

  Spacing(
      {this.s1 = SpacingTokens.s1,
      this.s2 = SpacingTokens.s2,
      this.s3 = SpacingTokens.s3,
      this.s4 = SpacingTokens.s4,
      this.s8 = SpacingTokens.s8,
      this.s12 = SpacingTokens.s12,
      this.s16 = SpacingTokens.s16,
      this.s20 = SpacingTokens.s20,
      this.s24 = SpacingTokens.s24,
      this.s28 = SpacingTokens.s28,
      this.s32 = SpacingTokens.s32,
      this.s36 = SpacingTokens.s36,
      this.s40 = SpacingTokens.s40,
      this.s44 = SpacingTokens.s44,
      this.s48 = SpacingTokens.s48,
      this.s52 = SpacingTokens.s52,
      this.s56 = SpacingTokens.s56,
      this.s60 = SpacingTokens.s60});
  @override
  flutter.ThemeExtension<Spacing> copyWith({
    double? s1,
    double? s2,
    double? s3,
    double? s4,
    double? s8,
    double? s12,
    double? s16,
    double? s20,
    double? s24,
    double? s28,
    double? s32,
    double? s36,
    double? s40,
    double? s44,
    double? s48,
    double? s52,
    double? s56,
    double? s60,
  }) {
    return Spacing(
      s1: s1 ?? this.s1,
      s2: s2 ?? this.s2,
      s3: s3 ?? this.s3,
      s4: s4 ?? this.s4,
      s8: s8 ?? this.s8,
      s12: s12 ?? this.s12,
      s16: s16 ?? this.s16,
      s20: s20 ?? this.s20,
      s24: s24 ?? this.s24,
      s28: s28 ?? this.s28,
      s32: s32 ?? this.s32,
      s36: s36 ?? this.s36,
      s40: s40 ?? this.s40,
      s44: s44 ?? this.s44,
      s48: s48 ?? this.s48,
      s52: s52 ?? this.s52,
      s56: s56 ?? this.s56,
      s60: s60 ?? this.s60,
    );
  }

  @override
  flutter.ThemeExtension<Spacing> lerp(
      covariant flutter.ThemeExtension<Spacing>? other, double t) {
    if (other is! Spacing) {
      return this;
    }

    return Spacing(
      s1: lerpDouble(s1, other.s1, t) ?? s1,
      s2: lerpDouble(s2, other.s2, t) ?? s2,
      s3: lerpDouble(s3, other.s3, t) ?? s3,
      s4: lerpDouble(s4, other.s4, t) ?? s4,
      s8: lerpDouble(s8, other.s8, t) ?? s8,
      s12: lerpDouble(s12, other.s8, t) ?? s12,
      s16: lerpDouble(s16, other.s16, t) ?? s16,
      s20: lerpDouble(s20, other.s20, t) ?? s20,
      s24: lerpDouble(s24, other.s24, t) ?? s24,
      s28: lerpDouble(s28, other.s28, t) ?? s28,
      s32: lerpDouble(s32, other.s32, t) ?? s32,
      s36: lerpDouble(s36, other.s36, t) ?? s36,
      s40: lerpDouble(s40, other.s40, t) ?? s40,
      s44: lerpDouble(s44, other.s44, t) ?? s44,
      s48: lerpDouble(s48, other.s48, t) ?? s48,
      s52: lerpDouble(s52, other.s52, t) ?? s52,
      s56: lerpDouble(s56, other.s56, t) ?? s56,
      s60: lerpDouble(s60, other.s60, t) ?? s60,
    );
  }
}
