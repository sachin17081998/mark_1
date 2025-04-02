import 'dart:ui';

import 'package:flutter/material.dart' as flutter;
import './sizing_tokens.dart';

class Sizing extends flutter.ThemeExtension<Sizing> {
  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s7;
  final double s8;
  final double s9;
  final double s10;
  final double s11;
  final double s12;
  final double s13;
  final double s14;
  final double s15;
  final double s16;
  final double quarter;
  final double half;

  double width20(final double width) => 0.2 * width;

  double width40(final double width) => 0.4 * width;

  double width60(final double width) => 0.6 * width;

  double width80(final double width) => 0.8 * width;

  double widthFull(final double width) => 1 * width;

  Sizing(
      {this.s1 = SizingTokens.s1,
      this.s2 = SizingTokens.s2,
      this.s3 = SizingTokens.s3,
      this.s4 = SizingTokens.s4,
      this.s5 = SizingTokens.s5,
      this.s6 = SizingTokens.s6,
      this.s7 = SizingTokens.s7,
      this.s8 = SizingTokens.s8,
      this.s9 = SizingTokens.s9,
      this.s10 = SizingTokens.s10,
      this.s11 = SizingTokens.s11,
      this.s12 = SizingTokens.s12,
      this.s13 = SizingTokens.s13,
      this.s14 = SizingTokens.s14,
      this.s15 = SizingTokens.s15,
      this.s16 = SizingTokens.s16,
      this.quarter = SizingTokens.quarter,
      this.half = SizingTokens.half});
  @override
  flutter.ThemeExtension<Sizing> copyWith({
    double? s1,
    double? s2,
    double? s3,
    double? s4,
    double? s5,
    double? s6,
    double? s7,
    double? s8,
    double? s9,
    double? s10,
    double? s11,
    double? s12,
    double? s13,
    double? s14,
    double? s15,
    double? s16,
    double? quarter,
    double? half,
  }) {
    return Sizing(
      s1: s1 ?? this.s1,
      s2: s2 ?? this.s2,
      s3: s3 ?? this.s3,
      s4: s4 ?? this.s4,
      s5: s5 ?? this.s5,
      s6: s6 ?? this.s6,
      s7: s7 ?? this.s7,
      s8: s8 ?? this.s8,
      s9: s9 ?? this.s9,
      s10: s10 ?? this.s10,
      s11: s11 ?? this.s11,
      s12: s12 ?? this.s12,
      s13: s13 ?? this.s13,
      s14: s14 ?? this.s14,
      s15: s15 ?? this.s15,
      s16: s16 ?? this.s16,
      quarter: quarter ?? this.quarter,
      half: half ?? this.half,
    );
  }

  @override
  flutter.ThemeExtension<Sizing> lerp(
      covariant flutter.ThemeExtension<Sizing>? other, double t) {
    if (other is! Sizing) {
      return this;
    }

    return Sizing(
      s1: lerpDouble(s1, other.s1, t) ?? s1,
      s2: lerpDouble(s2, other.s2, t) ?? s2,
      s3: lerpDouble(s3, other.s3, t) ?? s3,
      s4: lerpDouble(s4, other.s4, t) ?? s4,
      s5: lerpDouble(s5, other.s5, t) ?? s5,
      s6: lerpDouble(s6, other.s6, t) ?? s6,
      s7: lerpDouble(s7, other.s7, t) ?? s7,
      s8: lerpDouble(s8, other.s8, t) ?? s8,
      s9: lerpDouble(s9, other.s9, t) ?? s9,
      s10: lerpDouble(s10, other.s10, t) ?? s10,
      s11: lerpDouble(s11, other.s11, t) ?? s11,
      s12: lerpDouble(s12, other.s12, t) ?? s12,
      s13: lerpDouble(s13, other.s13, t) ?? s13,
      s14: lerpDouble(s14, other.s14, t) ?? s14,
      s15: lerpDouble(s15, other.s15, t) ?? s15,
      s16: lerpDouble(s16, other.s16, t) ?? s16,
      quarter: lerpDouble(quarter, other.quarter, t) ?? quarter,
      half: lerpDouble(half, other.half, t) ?? half,
    );
  }
}
