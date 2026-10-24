// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:material_ui/material_ui.dart';
import 'm3e_motion.dart';
import 'm3e_shapes.dart';
import 'm3e_spacing.dart';
import 'm3e_typography_flex.dart';

/// Normative ThemeExtension explicitly mapping all M3 Expressive tokens:
/// - 35 Iconic Shapes and Corner Tokens
/// - Typography Flex Scale
/// - Spacing Tokens (Zero Magic Numbers)
/// - Spring Motion Physics
@immutable
class M3EThemeExtension extends ThemeExtension<M3EThemeExtension> {
  const M3EThemeExtension({
    required this.spacing,
    required this.shapes,
    required this.typography,
    required this.motion,
  });

  /// Factory creating the standard Light M3E ThemeExtension.
  factory M3EThemeExtension.standardLight() {
    return M3EThemeExtension(
      spacing: const M3ESpacing(),
      shapes: const M3EShapes(),
      typography: M3ETypographyFlex.standard(onSurfaceColor: const Color(0xFF1D1B20)),
      motion: const M3EMotion(),
    );
  }

  /// Factory creating the standard Dark M3E ThemeExtension.
  factory M3EThemeExtension.standardDark() {
    return M3EThemeExtension(
      spacing: const M3ESpacing(),
      shapes: const M3EShapes(),
      typography: M3ETypographyFlex.standard(onSurfaceColor: const Color(0xFFE6E1E5)),
      motion: const M3EMotion(),
    );
  }

  final M3ESpacing spacing;
  final M3EShapes shapes;
  final M3ETypographyFlex typography;
  final M3EMotion motion;

  @override
  M3EThemeExtension copyWith({
    M3ESpacing? spacing,
    M3EShapes? shapes,
    M3ETypographyFlex? typography,
    M3EMotion? motion,
  }) {
    return M3EThemeExtension(
      spacing: spacing ?? this.spacing,
      shapes: shapes ?? this.shapes,
      typography: typography ?? this.typography,
      motion: motion ?? this.motion,
    );
  }

  @override
  M3EThemeExtension lerp(ThemeExtension<M3EThemeExtension>? other, double t) {
    if (other is! M3EThemeExtension) return this;
    return M3EThemeExtension(
      spacing: M3ESpacing.lerp(spacing, other.spacing, t),
      shapes: M3EShapes.lerp(shapes, other.shapes, t),
      typography: M3ETypographyFlex.lerp(typography, other.typography, t),
      motion: M3EMotion.lerp(motion, other.motion, t),
    );
  }
}

/// Convenience extension on [BuildContext] to access M3E tokens cleanly:
///
/// ```dart
/// final padding = context.m3e.spacing.all16;
/// final cardShape = context.m3e.shapes.shapeCard;
/// final headline = context.m3e.typography.headlineLargeFlex;
/// ```
extension M3EContext on BuildContext {
  M3EThemeExtension get m3e =>
      Theme.of(this).extension<M3EThemeExtension>() ?? M3EThemeExtension.standardLight();
}
