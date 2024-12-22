import 'package:flutter/material.dart';

class AppText extends ThemeExtension<AppText> {
  static const _baseFamily = 'AfacadFlux';
  static const _special = 'IndieFlower';

  // Define all the text styles for the tokens
  final TextStyle display;
  final TextStyle displayBold;
  final TextStyle displaySemiBold;

  final TextStyle headline;
  final TextStyle headlineBold;
  final TextStyle headlineSemiBold;

  final TextStyle title;
  final TextStyle titleBold;
  final TextStyle titleSemiBold;

  final TextStyle label;
  final TextStyle labelBold;
  final TextStyle labelSemiBold;

  final TextStyle body;
  final TextStyle bodyBold;
  final TextStyle bodySemiBold;

  // Special tokens
  final TextStyle special;
  final TextStyle specialBold;
  final TextStyle specialSemiBold;

  final TextStyle specialMedium;
  final TextStyle specialMediumBold;
  final TextStyle specialMediumSemiBold;

  final TextStyle specialLarge;
  final TextStyle specialLargeBold;
  final TextStyle specialLargeSemiBold;

  const AppText._internal({
    required this.display,
    required this.displayBold,
    required this.displaySemiBold,
    required this.headline,
    required this.headlineBold,
    required this.headlineSemiBold,
    required this.title,
    required this.titleBold,
    required this.titleSemiBold,
    required this.label,
    required this.labelBold,
    required this.labelSemiBold,
    required this.body,
    required this.bodyBold,
    required this.bodySemiBold,
    required this.special,
    required this.specialBold,
    required this.specialSemiBold,
    required this.specialMedium,
    required this.specialMediumBold,
    required this.specialMediumSemiBold,
    required this.specialLarge,
    required this.specialLargeBold,
    required this.specialLargeSemiBold,
  });

  factory AppText.main() {
    return const AppText._internal(
      display: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      displayBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 48,
        fontWeight: FontWeight.w800,
      ),
      displaySemiBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 48,
        fontWeight: FontWeight.w600,
      ),
      headline: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),
      headlineBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
      headlineSemiBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
      title: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      titleBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 32,
        fontWeight: FontWeight.w800,
      ),
      titleSemiBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      label: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      labelBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      labelSemiBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      body: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
      bodySemiBold: TextStyle(
        fontFamily: _baseFamily,
        package: 'ds_kit',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      special: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      specialBold: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      specialSemiBold: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      specialMedium: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),
      specialMediumBold: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
      specialMediumSemiBold: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
      specialLarge: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      specialLargeBold: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 48,
        fontWeight: FontWeight.w800,
      ),
      specialLargeSemiBold: TextStyle(
        fontFamily: _special,
        package: 'ds_kit',
        fontSize: 48,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  ThemeExtension<AppText> copyWith({
    TextStyle? display,
    TextStyle? displayBold,
    TextStyle? displaySemiBold,
    TextStyle? headline,
    TextStyle? headlineBold,
    TextStyle? headlineSemiBold,
    TextStyle? title,
    TextStyle? titleBold,
    TextStyle? titleSemiBold,
    TextStyle? label,
    TextStyle? labelBold,
    TextStyle? labelSemiBold,
    TextStyle? body,
    TextStyle? bodyBold,
    TextStyle? bodySemiBold,
    TextStyle? special,
    TextStyle? specialBold,
    TextStyle? specialSemiBold,
    TextStyle? specialMedium,
    TextStyle? specialMediumBold,
    TextStyle? specialMediumSemiBold,
    TextStyle? specialLarge,
    TextStyle? specialLargeBold,
    TextStyle? specialLargeSemiBold,
  }) {
    return AppText._internal(
      display: display ?? this.display,
      displayBold: displayBold ?? this.displayBold,
      displaySemiBold: displaySemiBold ?? this.displaySemiBold,
      headline: headline ?? this.headline,
      headlineBold: headlineBold ?? this.headlineBold,
      headlineSemiBold: headlineSemiBold ?? this.headlineSemiBold,
      title: title ?? this.title,
      titleBold: titleBold ?? this.titleBold,
      titleSemiBold: titleSemiBold ?? this.titleSemiBold,
      label: label ?? this.label,
      labelBold: labelBold ?? this.labelBold,
      labelSemiBold: labelSemiBold ?? this.labelSemiBold,
      body: body ?? this.body,
      bodyBold: bodyBold ?? this.bodyBold,
      bodySemiBold: bodySemiBold ?? this.bodySemiBold,
      special: special ?? this.special,
      specialBold: specialBold ?? this.specialBold,
      specialSemiBold: specialSemiBold ?? this.specialSemiBold,
      specialMedium: specialMedium ?? this.specialMedium,
      specialMediumBold: specialMediumBold ?? this.specialMediumBold,
      specialMediumSemiBold: specialMediumSemiBold ?? this.specialMediumSemiBold,
      specialLarge: specialLarge ?? this.specialLarge,
      specialLargeBold: specialLargeBold ?? this.specialLargeBold,
      specialLargeSemiBold: specialLargeSemiBold ?? this.specialLargeSemiBold,
    );
  }

  @override
  ThemeExtension<AppText> lerp(covariant ThemeExtension<AppText>? other, double t) {
    if (other is! AppText) return this;

    return AppText._internal(
      display: TextStyle.lerp(display, other.display, t) ?? display,
      displayBold: TextStyle.lerp(displayBold, other.displayBold, t) ?? displayBold,
      displaySemiBold: TextStyle.lerp(displaySemiBold, other.displaySemiBold, t) ?? displaySemiBold,
      headline: TextStyle.lerp(headline, other.headline, t) ?? headline,
      headlineBold: TextStyle.lerp(headlineBold, other.headlineBold, t) ?? headlineBold,
      headlineSemiBold: TextStyle.lerp(headlineSemiBold, other.headlineSemiBold, t) ?? headlineSemiBold,
      title: TextStyle.lerp(title, other.title, t) ?? title,
      titleBold: TextStyle.lerp(titleBold, other.titleBold, t) ?? titleBold,
      titleSemiBold: TextStyle.lerp(titleSemiBold, other.titleSemiBold, t) ?? titleSemiBold,
      label: TextStyle.lerp(label, other.label, t) ?? label,
      labelBold: TextStyle.lerp(labelBold, other.labelBold, t) ?? labelBold,
      labelSemiBold: TextStyle.lerp(labelSemiBold, other.labelSemiBold, t) ?? labelSemiBold,
      body: TextStyle.lerp(body, other.body, t) ?? body,
      bodyBold: TextStyle.lerp(bodyBold, other.bodyBold, t) ?? bodyBold,
      bodySemiBold: TextStyle.lerp(bodySemiBold, other.bodySemiBold, t) ?? bodySemiBold,
      special: TextStyle.lerp(special, other.special, t) ?? special,
      specialBold: TextStyle.lerp(specialBold, other.specialBold, t) ?? specialBold,
      specialSemiBold: TextStyle.lerp(specialSemiBold, other.specialSemiBold, t) ?? specialSemiBold,
      specialMedium: TextStyle.lerp(specialMedium, other.specialMedium, t) ?? specialMedium,
      specialMediumBold: TextStyle.lerp(specialMediumBold, other.specialMediumBold, t) ?? specialMediumBold,
      specialMediumSemiBold: TextStyle.lerp(specialMediumSemiBold, other.specialMediumSemiBold, t) ?? specialMediumSemiBold,
      specialLarge: TextStyle.lerp(specialLarge, other.specialLarge, t) ?? specialLarge,
      specialLargeBold: TextStyle.lerp(specialLargeBold, other.specialLargeBold, t) ?? specialLargeBold,
      specialLargeSemiBold: TextStyle.lerp(specialLargeSemiBold, other.specialLargeSemiBold, t) ?? specialLargeSemiBold,
    );
  }
}




// import 'package:flutter/material.dart';

// class AppText extends ThemeExtension<AppText> {
//   static const _baseFamily = 'AfacadFlux';

//   final TextStyle display;
//   final TextStyle displayBold;
//   final TextStyle displaySemiBold;

//   final TextStyle headline;
//   final TextStyle headlineBold;
//   final TextStyle headlineSemiBold;

//   final TextStyle title;
//   final TextStyle titleBold;
//   final TextStyle titleSemiBold;


//   final TextStyle label;
//   final TextStyle labelBold;
//   final TextStyle labelSemiBold;

//   final TextStyle body;
//   final TextStyle bodyBold;
//   final TextStyle bodySemiBold;

//   const AppText._internal({
//     required this.display,
//     required this.displayBold,
//     required this.displaySemiBold,
//     required this.headline,
//     required this.headlineBold,
//     required this.headlineSemiBold,
//     required this.title,
//     required this.titleBold,
//     required this.titleSemiBold,
//     required this.label,
//     required this.labelBold,
//     required this.labelSemiBold,
//     required this.body,
//     required this.bodyBold,
//     required this.bodySemiBold
//   });

//   factory AppText.main() {
//     return const AppText._internal(
//       display:TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 48,
//       fontWeight: FontWeight.w400
//     ) ,
//       displayBold:TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 48,
//       fontWeight: FontWeight.w800
//     ) ,
//       displaySemiBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 48,
//       fontWeight: FontWeight.w600
//     ),
//         headline: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 36,
//       fontWeight: FontWeight.w400
//     ),
//      headlineBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 36,
//       fontWeight: FontWeight.w800
//     ),
//      headlineSemiBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 36,
//       fontWeight: FontWeight.w600
//     ),
//          title: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 32,
//       fontWeight: FontWeight.w400
//     ),
//           titleBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 32,
//       fontWeight: FontWeight.w800
//     ), 
//           titleSemiBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 32,
//       fontWeight: FontWeight.w600
//     ),
//             label: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 24,
//       fontWeight: FontWeight.w400
//     ),
//              labelBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 24,
//       fontWeight: FontWeight.w800
//     ),
//               labelSemiBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 24,
//       fontWeight: FontWeight.w600
//     ), 
//                body: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 16,
//       fontWeight: FontWeight.w400
//     ),
//                bodyBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 16,
//       fontWeight: FontWeight.w800
//     ),
//                bodySemiBold: TextStyle(
//       fontFamily: _baseFamily,
//       package: 'ds_kit',
//       fontSize: 16,
//       fontWeight: FontWeight.w600
//     ),
//                );
//   }

//   @override
//   ThemeExtension<AppText> copyWith() {
//     return AppText._internal(display: display);
//   }

//   @override
//   ThemeExtension<AppText> lerp(
//       covariant ThemeExtension<AppText>? other, double t) {
//     if (other is! AppText) return this;

//     return AppText._internal(
//       display: TextStyle.lerp(display, other.display, t) ?? display,
//     );
//   }
// }
