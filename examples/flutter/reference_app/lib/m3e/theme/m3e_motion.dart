// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

/// Spring-loaded motion physics matching Material 3 Expressive guidelines.
///
/// M3 Expressive specifies two motion schemes:
/// 1. Spatial Springs: Bouncy with intentional overshoot for bounds, position, and morphing.
/// 2. Effect Springs: Damped, non-overshooting for color, alpha, and elevation fades.
@immutable
class M3EMotion {
  const M3EMotion({
    this.durationFast = const Duration(milliseconds: 150),
    this.durationMedium = const Duration(milliseconds: 300),
    this.durationSlow = const Duration(milliseconds: 500),
    this.curveSpatialOvershoot = Curves.easeOutBack,
    this.curveContainerMorph = Curves.fastOutSlowIn,
    this.curveEffectFade = Curves.easeOutCubic,
  });

  final Duration durationFast;
  final Duration durationMedium;
  final Duration durationSlow;

  final Curve curveSpatialOvershoot;
  final Curve curveContainerMorph;
  final Curve curveEffectFade;

  /// Spatial Spring Physics: Bouncy overshoot for interactive tactile moments.
  /// Standard M3E parameters: Mass: 1.0, Stiffness: 380.0, Damping: 18.0.
  SpringSimulation createSpatialSpring({
    double start = 0.0,
    double end = 1.0,
    double velocity = 0.0,
  }) {
    return SpringSimulation(
      const SpringDescription(
        mass: 1.0,
        stiffness: 380.0,
        damping: 18.0,
      ),
      start,
      end,
      velocity,
    );
  }

  /// Effect Spring Physics: Smoothly damped transition for alpha, opacity, and color fades.
  /// Standard parameters: Mass: 1.0, Stiffness: 500.0, Damping: 35.0.
  SpringSimulation createEffectSpring({
    double start = 0.0,
    double end = 1.0,
    double velocity = 0.0,
  }) {
    return SpringSimulation(
      const SpringDescription(
        mass: 1.0,
        stiffness: 500.0,
        damping: 35.0,
      ),
      start,
      end,
      velocity,
    );
  }

  M3EMotion copyWith({
    Duration? durationFast,
    Duration? durationMedium,
    Duration? durationSlow,
    Curve? curveSpatialOvershoot,
    Curve? curveContainerMorph,
    Curve? curveEffectFade,
  }) {
    return M3EMotion(
      durationFast: durationFast ?? this.durationFast,
      durationMedium: durationMedium ?? this.durationMedium,
      durationSlow: durationSlow ?? this.durationSlow,
      curveSpatialOvershoot: curveSpatialOvershoot ?? this.curveSpatialOvershoot,
      curveContainerMorph: curveContainerMorph ?? this.curveContainerMorph,
      curveEffectFade: curveEffectFade ?? this.curveEffectFade,
    );
  }

  static M3EMotion lerp(M3EMotion a, M3EMotion b, double t) {
    return t < 0.5 ? a : b;
  }
}
