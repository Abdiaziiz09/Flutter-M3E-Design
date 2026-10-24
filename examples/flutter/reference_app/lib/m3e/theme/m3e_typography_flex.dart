// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:material_ui/material_ui.dart';

/// Explicit Typography Flex scale mapping variable font axes (opsz, wght, wdth)
/// and expressive editorial hierarchy according to Material 3 Expressive guidelines.
@immutable
class M3ETypographyFlex {
  const M3ETypographyFlex({
    required this.displayLargeFlex,
    required this.displayMediumFlex,
    required this.displaySmallFlex,
    required this.headlineLargeFlex,
    required this.headlineMediumFlex,
    required this.headlineSmallFlex,
    required this.titleLargeFlex,
    required this.titleMediumFlex,
    required this.titleSmallFlex,
    required this.bodyLargeFlex,
    required this.bodyMediumFlex,
    required this.bodySmallFlex,
    required this.labelLargeFlex,
    required this.labelMediumFlex,
    required this.labelSmallFlex,
  });

  /// Factory creating standard M3E Flex Typography with optical sizing and weights.
  factory M3ETypographyFlex.standard({required Color onSurfaceColor}) {
    TextStyle flexStyle({
      required double fontSize,
      required double height,
      required FontWeight fontWeight,
      double letterSpacing = 0.0,
      double? opticalSize,
    }) {
      return TextStyle(
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: onSurfaceColor,
        fontFeatures: [
          if (opticalSize != null) FontFeature('opsz', opticalSize.round()),
        ],
      );
    }

    return M3ETypographyFlex(
      displayLargeFlex: flexStyle(fontSize: 57, height: 1.12, fontWeight: FontWeight.w400, letterSpacing: -0.25, opticalSize: 57),
      displayMediumFlex: flexStyle(fontSize: 45, height: 1.16, fontWeight: FontWeight.w400, opticalSize: 45),
      displaySmallFlex: flexStyle(fontSize: 36, height: 1.22, fontWeight: FontWeight.w400, opticalSize: 36),
      headlineLargeFlex: flexStyle(fontSize: 32, height: 1.25, fontWeight: FontWeight.w700, letterSpacing: -0.2, opticalSize: 32),
      headlineMediumFlex: flexStyle(fontSize: 28, height: 1.29, fontWeight: FontWeight.w600, opticalSize: 28),
      headlineSmallFlex: flexStyle(fontSize: 24, height: 1.33, fontWeight: FontWeight.w600, opticalSize: 24),
      titleLargeFlex: flexStyle(fontSize: 22, height: 1.27, fontWeight: FontWeight.w600, opticalSize: 22),
      titleMediumFlex: flexStyle(fontSize: 16, height: 1.50, fontWeight: FontWeight.w600, letterSpacing: 0.15, opticalSize: 16),
      titleSmallFlex: flexStyle(fontSize: 14, height: 1.43, fontWeight: FontWeight.w500, letterSpacing: 0.1, opticalSize: 14),
      bodyLargeFlex: flexStyle(fontSize: 16, height: 1.50, fontWeight: FontWeight.w400, letterSpacing: 0.5, opticalSize: 16),
      bodyMediumFlex: flexStyle(fontSize: 14, height: 1.43, fontWeight: FontWeight.w400, letterSpacing: 0.25, opticalSize: 14),
      bodySmallFlex: flexStyle(fontSize: 12, height: 1.33, fontWeight: FontWeight.w400, letterSpacing: 0.4, opticalSize: 12),
      labelLargeFlex: flexStyle(fontSize: 14, height: 1.43, fontWeight: FontWeight.w600, letterSpacing: 0.1, opticalSize: 14),
      labelMediumFlex: flexStyle(fontSize: 12, height: 1.33, fontWeight: FontWeight.w600, letterSpacing: 0.5, opticalSize: 12),
      labelSmallFlex: flexStyle(fontSize: 11, height: 1.45, fontWeight: FontWeight.w500, letterSpacing: 0.5, opticalSize: 11),
    );
  }

  final TextStyle displayLargeFlex;
  final TextStyle displayMediumFlex;
  final TextStyle displaySmallFlex;

  final TextStyle headlineLargeFlex;
  final TextStyle headlineMediumFlex;
  final TextStyle headlineSmallFlex;

  final TextStyle titleLargeFlex;
  final TextStyle titleMediumFlex;
  final TextStyle titleSmallFlex;

  final TextStyle bodyLargeFlex;
  final TextStyle bodyMediumFlex;
  final TextStyle bodySmallFlex;

  final TextStyle labelLargeFlex;
  final TextStyle labelMediumFlex;
  final TextStyle labelSmallFlex;

  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: displayLargeFlex,
      displayMedium: displayMediumFlex,
      displaySmall: displaySmallFlex,
      headlineLarge: headlineLargeFlex,
      headlineMedium: headlineMediumFlex,
      headlineSmall: headlineSmallFlex,
      titleLarge: titleLargeFlex,
      titleMedium: titleMediumFlex,
      titleSmall: titleSmallFlex,
      bodyLarge: bodyLargeFlex,
      bodyMedium: bodyMediumFlex,
      bodySmall: bodySmallFlex,
      labelLarge: labelLargeFlex,
      labelMedium: labelMediumFlex,
      labelSmall: labelSmallFlex,
    );
  }

  M3ETypographyFlex copyWith({
    TextStyle? displayLargeFlex,
    TextStyle? displayMediumFlex,
    TextStyle? displaySmallFlex,
    TextStyle? headlineLargeFlex,
    TextStyle? headlineMediumFlex,
    TextStyle? headlineSmallFlex,
    TextStyle? titleLargeFlex,
    TextStyle? titleMediumFlex,
    TextStyle? titleSmallFlex,
    TextStyle? bodyLargeFlex,
    TextStyle? bodyMediumFlex,
    TextStyle? bodySmallFlex,
    TextStyle? labelLargeFlex,
    TextStyle? labelMediumFlex,
    TextStyle? labelSmallFlex,
  }) {
    return M3ETypographyFlex(
      displayLargeFlex: displayLargeFlex ?? this.displayLargeFlex,
      displayMediumFlex: displayMediumFlex ?? this.displayMediumFlex,
      displaySmallFlex: displaySmallFlex ?? this.displaySmallFlex,
      headlineLargeFlex: headlineLargeFlex ?? this.headlineLargeFlex,
      headlineMediumFlex: headlineMediumFlex ?? this.headlineMediumFlex,
      headlineSmallFlex: headlineSmallFlex ?? this.headlineSmallFlex,
      titleLargeFlex: titleLargeFlex ?? this.titleLargeFlex,
      titleMediumFlex: titleMediumFlex ?? this.titleMediumFlex,
      titleSmallFlex: titleSmallFlex ?? this.titleSmallFlex,
      bodyLargeFlex: bodyLargeFlex ?? this.bodyLargeFlex,
      bodyMediumFlex: bodyMediumFlex ?? this.bodyMediumFlex,
      bodySmallFlex: bodySmallFlex ?? this.bodySmallFlex,
      labelLargeFlex: labelLargeFlex ?? this.labelLargeFlex,
      labelMediumFlex: labelMediumFlex ?? this.labelMediumFlex,
      labelSmallFlex: labelSmallFlex ?? this.labelSmallFlex,
    );
  }

  static M3ETypographyFlex lerp(M3ETypographyFlex a, M3ETypographyFlex b, double t) {
    return M3ETypographyFlex(
      displayLargeFlex: TextStyle.lerp(a.displayLargeFlex, b.displayLargeFlex, t)!,
      displayMediumFlex: TextStyle.lerp(a.displayMediumFlex, b.displayMediumFlex, t)!,
      displaySmallFlex: TextStyle.lerp(a.displaySmallFlex, b.displaySmallFlex, t)!,
      headlineLargeFlex: TextStyle.lerp(a.headlineLargeFlex, b.headlineLargeFlex, t)!,
      headlineMediumFlex: TextStyle.lerp(a.headlineMediumFlex, b.headlineMediumFlex, t)!,
      headlineSmallFlex: TextStyle.lerp(a.headlineSmallFlex, b.headlineSmallFlex, t)!,
      titleLargeFlex: TextStyle.lerp(a.titleLargeFlex, b.titleLargeFlex, t)!,
      titleMediumFlex: TextStyle.lerp(a.titleMediumFlex, b.titleMediumFlex, t)!,
      titleSmallFlex: TextStyle.lerp(a.titleSmallFlex, b.titleSmallFlex, t)!,
      bodyLargeFlex: TextStyle.lerp(a.bodyLargeFlex, b.bodyLargeFlex, t)!,
      bodyMediumFlex: TextStyle.lerp(a.bodyMediumFlex, b.bodyMediumFlex, t)!,
      bodySmallFlex: TextStyle.lerp(a.bodySmallFlex, b.bodySmallFlex, t)!,
      labelLargeFlex: TextStyle.lerp(a.labelLargeFlex, b.labelLargeFlex, t)!,
      labelMediumFlex: TextStyle.lerp(a.labelMediumFlex, b.labelMediumFlex, t)!,
      labelSmallFlex: TextStyle.lerp(a.labelSmallFlex, b.labelSmallFlex, t)!,
    );
  }
}
