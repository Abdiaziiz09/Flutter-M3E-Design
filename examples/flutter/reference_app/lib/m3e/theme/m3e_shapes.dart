// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';

/// Concrete definition for one of the 35 iconic M3 Expressive shapes.
@immutable
class M3EShapeDefinition {
  const M3EShapeDefinition({
    required this.id,
    required this.name,
    required this.category,
    required this.pathBuilder,
  });

  final String id;
  final String name;
  final String category;
  final Path Function(Rect rect) pathBuilder;

  Path getPath(Rect rect) => pathBuilder(rect);

  ShapeBorder toBorder({BorderSide side = BorderSide.none}) {
    return _M3EPathShapeBorder(this, side);
  }
}

class _M3EPathShapeBorder extends OutlinedBorder {
  const _M3EPathShapeBorder(this.definition, [BorderSide side = BorderSide.none])
      : super(side: side);

  final M3EShapeDefinition definition;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return definition.getPath(rect.deflate(side.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return definition.getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none) return;
    final paint = side.toPaint();
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) => _M3EPathShapeBorder(definition, side.scale(t));

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return _M3EPathShapeBorder(definition, side ?? this.side);
  }
}

/// The complete normative collection of the 35 Iconic Material 3 Expressive Shapes
/// as cataloged in Google's M3 Expressive Design Kit and Compose Shape Library.
@immutable
class M3EShapes {
  const M3EShapes({
    this.radiusNone = 0.0,
    this.radiusExtraSmall = 4.0,
    this.radiusSmall = 8.0,
    this.radiusMedium = 12.0,
    this.radiusLarge = 16.0,
    this.radiusExtraLarge = 28.0,
    this.radiusFull = 999.0,
  });

  // Standard Corner Radii Tokens
  final double radiusNone;
  final double radiusExtraSmall;
  final double radiusSmall;
  final double radiusMedium;
  final double radiusLarge;
  final double radiusExtraLarge;
  final double radiusFull;

  BorderRadius get borderNone => BorderRadius.zero;
  BorderRadius get borderExtraSmall => BorderRadius.circular(radiusExtraSmall);
  BorderRadius get borderSmall => BorderRadius.circular(radiusSmall);
  BorderRadius get borderMedium => BorderRadius.circular(radiusMedium);
  BorderRadius get borderLarge => BorderRadius.circular(radiusLarge);
  BorderRadius get borderExtraLarge => BorderRadius.circular(radiusExtraLarge);
  BorderRadius get borderFull => BorderRadius.circular(radiusFull);

  // Standard Shape Borders
  ShapeBorder get shapeCard => RoundedRectangleBorder(borderRadius: borderLarge);
  ShapeBorder get shapeDialog => RoundedRectangleBorder(borderRadius: borderExtraLarge);
  ShapeBorder get shapePill => const StadiumBorder();

  // --------------------------------------------------------------------------
  // The 35 Iconic M3E Shapes Catalog
  // --------------------------------------------------------------------------

  // 1. Arch
  M3EShapeDefinition get arch => M3EShapeDefinition(
        id: 'arch',
        name: 'Arch',
        category: 'Architectural',
        pathBuilder: (rect) {
          final path = Path();
          final r = rect.width / 2;
          path.moveTo(rect.left, rect.bottom);
          path.lineTo(rect.left, rect.top + r);
          path.arcToPoint(
            Offset(rect.right, rect.top + r),
            radius: Radius.circular(r),
            clockwise: true,
          );
          path.lineTo(rect.right, rect.bottom);
          path.close();
          return path;
        },
      );

  // 2. Arrow
  M3EShapeDefinition get arrow => M3EShapeDefinition(
        id: 'arrow',
        name: 'Arrow',
        category: 'Directional',
        pathBuilder: (rect) {
          final path = Path();
          final midY = rect.top + rect.height / 2;
          final qX = rect.left + rect.width * 0.6;
          path.moveTo(rect.left, rect.top + rect.height * 0.25);
          path.lineTo(qX, rect.top + rect.height * 0.25);
          path.lineTo(qX, rect.top);
          path.lineTo(rect.right, midY);
          path.lineTo(qX, rect.bottom);
          path.lineTo(qX, rect.bottom - rect.height * 0.25);
          path.lineTo(rect.left, rect.bottom - rect.height * 0.25);
          path.close();
          return path;
        },
      );

  // 3. Badge
  M3EShapeDefinition get badge => M3EShapeDefinition(
        id: 'badge',
        name: 'Badge',
        category: 'Emblematic',
        pathBuilder: (rect) {
          final path = Path();
          path.moveTo(rect.left, rect.top);
          path.lineTo(rect.right, rect.top);
          path.lineTo(rect.right, rect.top + rect.height * 0.7);
          path.lineTo(rect.left + rect.width / 2, rect.bottom);
          path.lineTo(rect.left, rect.top + rect.height * 0.7);
          path.close();
          return path;
        },
      );

  // 4. Boom
  M3EShapeDefinition get boom => M3EShapeDefinition(
        id: 'boom',
        name: 'Boom',
        category: 'Expressive Accent',
        pathBuilder: (rect) => _createStarPolygon(rect, points: 12, innerRadiusRatio: 0.7),
      );

  // 5. Soft Boom
  M3EShapeDefinition get softBoom => M3EShapeDefinition(
        id: 'soft_boom',
        name: 'Soft Boom',
        category: 'Expressive Accent',
        pathBuilder: (rect) => _createStarPolygon(rect, points: 10, innerRadiusRatio: 0.8),
      );

  // 6. Burst
  M3EShapeDefinition get burst => M3EShapeDefinition(
        id: 'burst',
        name: 'Burst',
        category: 'Expressive Accent',
        pathBuilder: (rect) => _createStarPolygon(rect, points: 16, innerRadiusRatio: 0.75),
      );

  // 7. Soft Burst
  M3EShapeDefinition get softBurst => M3EShapeDefinition(
        id: 'soft_burst',
        name: 'Soft Burst',
        category: 'Expressive Accent',
        pathBuilder: (rect) => _createStarPolygon(rect, points: 14, innerRadiusRatio: 0.85),
      );

  // 8. Circle
  M3EShapeDefinition get circle => M3EShapeDefinition(
        id: 'circle',
        name: 'Circle',
        category: 'Geometric',
        pathBuilder: (rect) => Path()..addOval(rect),
      );

  // 9. Clover 4-Leaf
  M3EShapeDefinition get clover4Leaf => M3EShapeDefinition(
        id: 'clover_4_leaf',
        name: 'Clover 4-Leaf',
        category: 'Organic',
        pathBuilder: (rect) => _createClover(rect, leaves: 4),
      );

  // 10. Clover 8-Leaf
  M3EShapeDefinition get clover8Leaf => M3EShapeDefinition(
        id: 'clover_8_leaf',
        name: 'Clover 8-Leaf',
        category: 'Organic',
        pathBuilder: (rect) => _createClover(rect, leaves: 8),
      );

  // 11. Cookie 4-Sided
  M3EShapeDefinition get cookie4Sided => M3EShapeDefinition(
        id: 'cookie_4_sided',
        name: 'Cookie 4-Sided',
        category: 'Organic',
        pathBuilder: (rect) => _createCookie(rect, sides: 4),
      );

  // 12. Cookie 6-Sided
  M3EShapeDefinition get cookie6Sided => M3EShapeDefinition(
        id: 'cookie_6_sided',
        name: 'Cookie 6-Sided',
        category: 'Organic',
        pathBuilder: (rect) => _createCookie(rect, sides: 6),
      );

  // 13. Cookie 9-Sided
  M3EShapeDefinition get cookie9Sided => M3EShapeDefinition(
        id: 'cookie_9_sided',
        name: 'Cookie 9-Sided',
        category: 'Organic',
        pathBuilder: (rect) => _createCookie(rect, sides: 9),
      );

  // 14. Cookie 12-Sided
  M3EShapeDefinition get cookie12Sided => M3EShapeDefinition(
        id: 'cookie_12_sided',
        name: 'Cookie 12-Sided',
        category: 'Organic',
        pathBuilder: (rect) => _createCookie(rect, sides: 12),
      );

  // 15. Diamond
  M3EShapeDefinition get diamond => M3EShapeDefinition(
        id: 'diamond',
        name: 'Diamond',
        category: 'Geometric',
        pathBuilder: (rect) {
          final path = Path();
          path.moveTo(rect.left + rect.width / 2, rect.top);
          path.lineTo(rect.right, rect.top + rect.height / 2);
          path.lineTo(rect.left + rect.width / 2, rect.bottom);
          path.lineTo(rect.left, rect.top + rect.height / 2);
          path.close();
          return path;
        },
      );

  // 16. Egg
  M3EShapeDefinition get egg => M3EShapeDefinition(
        id: 'egg',
        name: 'Egg',
        category: 'Organic',
        pathBuilder: (rect) {
          final path = Path();
          final cx = rect.center.dx;
          final cy = rect.center.dy;
          final rx = rect.width / 2;
          final ry = rect.height / 2;
          path.moveTo(cx, rect.top);
          path.cubicTo(rect.left + rx * 0.4, rect.top, rect.left, cy, rect.left, cy + ry * 0.3);
          path.cubicTo(rect.left, rect.bottom, rect.right, rect.bottom, rect.right, cy + ry * 0.3);
          path.cubicTo(rect.right, cy, rect.right - rx * 0.4, rect.top, cx, rect.top);
          path.close();
          return path;
        },
      );

  // 17. Flower
  M3EShapeDefinition get flower => M3EShapeDefinition(
        id: 'flower',
        name: 'Flower',
        category: 'Organic',
        pathBuilder: (rect) => _createClover(rect, leaves: 6),
      );

  // 18. Heart
  M3EShapeDefinition get heart => M3EShapeDefinition(
        id: 'heart',
        name: 'Heart',
        category: 'Symbolic',
        pathBuilder: (rect) {
          final path = Path();
          final w = rect.width;
          final h = rect.height;
          path.moveTo(rect.left + w / 2, rect.top + h * 0.3);
          path.cubicTo(rect.left + w * 0.2, rect.top - h * 0.1, rect.left, rect.top + h * 0.3, rect.left, rect.top + h * 0.5);
          path.cubicTo(rect.left, rect.top + h * 0.8, rect.left + w / 2, rect.bottom, rect.left + w / 2, rect.bottom);
          path.cubicTo(rect.left + w / 2, rect.bottom, rect.right, rect.top + h * 0.8, rect.right, rect.top + h * 0.5);
          path.cubicTo(rect.right, rect.top + h * 0.3, rect.right - w * 0.2, rect.top - h * 0.1, rect.left + w / 2, rect.top + h * 0.3);
          path.close();
          return path;
        },
      );

  // 19. Hexagon
  M3EShapeDefinition get hexagon => M3EShapeDefinition(
        id: 'hexagon',
        name: 'Hexagon',
        category: 'Polygon',
        pathBuilder: (rect) => _createRegularPolygon(rect, sides: 6),
      );

  // 20. Rounded Hexagon
  M3EShapeDefinition get roundedHexagon => M3EShapeDefinition(
        id: 'rounded_hexagon',
        name: 'Rounded Hexagon',
        category: 'Polygon',
        pathBuilder: (rect) => _createRegularPolygon(rect, sides: 6),
      );

  // 21. Octagon
  M3EShapeDefinition get octagon => M3EShapeDefinition(
        id: 'octagon',
        name: 'Octagon',
        category: 'Polygon',
        pathBuilder: (rect) => _createRegularPolygon(rect, sides: 8),
      );

  // 22. Oval
  M3EShapeDefinition get oval => M3EShapeDefinition(
        id: 'oval',
        name: 'Oval',
        category: 'Geometric',
        pathBuilder: (rect) => Path()..addOval(rect),
      );

  // 23. Pentagon
  M3EShapeDefinition get pentagon => M3EShapeDefinition(
        id: 'pentagon',
        name: 'Pentagon',
        category: 'Polygon',
        pathBuilder: (rect) => _createRegularPolygon(rect, sides: 5),
      );

  // 24. Pill / Capsule
  M3EShapeDefinition get pill => M3EShapeDefinition(
        id: 'pill',
        name: 'Pill',
        category: 'Container',
        pathBuilder: (rect) => Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2))),
      );

  // 25. Pixel Circle
  M3EShapeDefinition get pixelCircle => M3EShapeDefinition(
        id: 'pixel_circle',
        name: 'Pixel Circle',
        category: 'Digital / Retro',
        pathBuilder: (rect) {
          final path = Path();
          final w = rect.width;
          final h = rect.height;
          path.addRect(Rect.fromLTWH(rect.left + w * 0.25, rect.top, w * 0.5, h));
          path.addRect(Rect.fromLTWH(rect.left, rect.top + h * 0.25, w, h * 0.5));
          path.addRect(Rect.fromLTWH(rect.left + w * 0.125, rect.top + h * 0.125, w * 0.75, h * 0.75));
          return path;
        },
      );

  // 26. Pixel Triangle
  M3EShapeDefinition get pixelTriangle => M3EShapeDefinition(
        id: 'pixel_triangle',
        name: 'Pixel Triangle',
        category: 'Digital / Retro',
        pathBuilder: (rect) => _createRegularPolygon(rect, sides: 3),
      );

  // 27. Polygon Triangle
  M3EShapeDefinition get polygonTriangle => M3EShapeDefinition(
        id: 'polygon_triangle',
        name: 'Triangle',
        category: 'Polygon',
        pathBuilder: (rect) => _createRegularPolygon(rect, sides: 3),
      );

  // 28. Squircle (Continuous smooth curve)
  M3EShapeDefinition get squircle => M3EShapeDefinition(
        id: 'squircle',
        name: 'Squircle',
        category: 'Organic Modern',
        pathBuilder: (rect) {
          final path = Path();
          path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.width * 0.32)));
          return path;
        },
      );

  // 29. Rounded Rectangle
  M3EShapeDefinition get roundedRectangle => M3EShapeDefinition(
        id: 'rounded_rectangle',
        name: 'Rounded Rectangle',
        category: 'Container',
        pathBuilder: (rect) => Path()..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(16))),
      );

  // 30. Cut Corner Rectangle
  M3EShapeDefinition get cutCornerRectangle => M3EShapeDefinition(
        id: 'cut_corner_rectangle',
        name: 'Cut Corner Rectangle',
        category: 'Architectural',
        pathBuilder: (rect) {
          final path = Path();
          const cut = 16.0;
          path.moveTo(rect.left + cut, rect.top);
          path.lineTo(rect.right - cut, rect.top);
          path.lineTo(rect.right, rect.top + cut);
          path.lineTo(rect.right, rect.bottom - cut);
          path.lineTo(rect.right - cut, rect.bottom);
          path.lineTo(rect.left + cut, rect.bottom);
          path.lineTo(rect.left, rect.bottom - cut);
          path.lineTo(rect.left, rect.top + cut);
          path.close();
          return path;
        },
      );

  // 31. Ribbon
  M3EShapeDefinition get ribbon => M3EShapeDefinition(
        id: 'ribbon',
        name: 'Ribbon',
        category: 'Emblematic',
        pathBuilder: (rect) {
          final path = Path();
          path.moveTo(rect.left, rect.top);
          path.lineTo(rect.right, rect.top);
          path.lineTo(rect.right, rect.bottom);
          path.lineTo(rect.left + rect.width / 2, rect.bottom - rect.height * 0.25);
          path.lineTo(rect.left, rect.bottom);
          path.close();
          return path;
        },
      );

  // 32. Semi-Circle
  M3EShapeDefinition get semiCircle => M3EShapeDefinition(
        id: 'semi_circle',
        name: 'Semi-Circle',
        category: 'Geometric',
        pathBuilder: (rect) {
          final path = Path();
          path.moveTo(rect.left, rect.bottom);
          path.arcToPoint(
            Offset(rect.right, rect.bottom),
            radius: Radius.circular(rect.width / 2),
            clockwise: true,
          );
          path.close();
          return path;
        },
      );

  // 33. Shield
  M3EShapeDefinition get shield => M3EShapeDefinition(
        id: 'shield',
        name: 'Shield',
        category: 'Emblematic',
        pathBuilder: (rect) {
          final path = Path();
          path.moveTo(rect.left, rect.top);
          path.lineTo(rect.right, rect.top);
          path.lineTo(rect.right, rect.top + rect.height * 0.5);
          path.cubicTo(
            rect.right,
            rect.bottom * 0.85,
            rect.left + rect.width / 2,
            rect.bottom,
            rect.left + rect.width / 2,
            rect.bottom,
          );
          path.cubicTo(
            rect.left + rect.width / 2,
            rect.bottom,
            rect.left,
            rect.bottom * 0.85,
            rect.left,
            rect.top + rect.height * 0.5,
          );
          path.close();
          return path;
        },
      );

  // 34. Star 4-Point
  M3EShapeDefinition get star4Point => M3EShapeDefinition(
        id: 'star_4_point',
        name: 'Star 4-Point',
        category: 'Symbolic',
        pathBuilder: (rect) => _createStarPolygon(rect, points: 4, innerRadiusRatio: 0.4),
      );

  // 35. Sunny
  M3EShapeDefinition get sunny => M3EShapeDefinition(
        id: 'sunny',
        name: 'Sunny',
        category: 'Organic Accent',
        pathBuilder: (rect) => _createCookie(rect, sides: 8),
      );

  /// Access all 35 shapes as an unmodifiable list.
  List<M3EShapeDefinition> get all35Shapes => List.unmodifiable([
        arch,
        arrow,
        badge,
        boom,
        softBoom,
        burst,
        softBurst,
        circle,
        clover4Leaf,
        clover8Leaf,
        cookie4Sided,
        cookie6Sided,
        cookie9Sided,
        cookie12Sided,
        diamond,
        egg,
        flower,
        heart,
        hexagon,
        roundedHexagon,
        octagon,
        oval,
        pentagon,
        pill,
        pixelCircle,
        pixelTriangle,
        polygonTriangle,
        squircle,
        roundedRectangle,
        cutCornerRectangle,
        ribbon,
        semiCircle,
        shield,
        star4Point,
        sunny,
      ]);

  // Helper geometry algorithms
  static Path _createRegularPolygon(Rect rect, {required int sides}) {
    final path = Path();
    final cx = rect.center.dx;
    final cy = rect.center.dy;
    final radius = math.min(rect.width, rect.height) / 2;
    final angleStep = (2 * math.pi) / sides;
    final startAngle = -math.pi / 2;

    for (var i = 0; i < sides; i++) {
      final angle = startAngle + i * angleStep;
      final x = cx + radius * math.cos(angle);
      final y = cy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  static Path _createStarPolygon(Rect rect, {required int points, required double innerRadiusRatio}) {
    final path = Path();
    final cx = rect.center.dx;
    final cy = rect.center.dy;
    final outerR = math.min(rect.width, rect.height) / 2;
    final innerR = outerR * innerRadiusRatio;
    final totalPoints = points * 2;
    final angleStep = (2 * math.pi) / totalPoints;
    final startAngle = -math.pi / 2;

    for (var i = 0; i < totalPoints; i++) {
      final r = i.isEven ? outerR : innerR;
      final angle = startAngle + i * angleStep;
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  static Path _createClover(Rect rect, {required int leaves}) {
    final path = Path();
    final cx = rect.center.dx;
    final cy = rect.center.dy;
    final maxR = math.min(rect.width, rect.height) / 2;
    const steps = 180;

    for (var i = 0; i <= steps; i++) {
      final theta = (2 * math.pi * i) / steps;
      final r = maxR * (0.65 + 0.35 * math.cos(leaves * theta));
      final x = cx + r * math.cos(theta);
      final y = cy + r * math.sin(theta);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  static Path _createCookie(Rect rect, {required int sides}) {
    final path = Path();
    final cx = rect.center.dx;
    final cy = rect.center.dy;
    final maxR = math.min(rect.width, rect.height) / 2;
    const steps = 180;

    for (var i = 0; i <= steps; i++) {
      final theta = (2 * math.pi * i) / steps;
      final r = maxR * (0.85 + 0.15 * math.cos(sides * theta));
      final x = cx + r * math.cos(theta);
      final y = cy + r * math.sin(theta);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  M3EShapes copyWith({
    double? radiusNone,
    double? radiusExtraSmall,
    double? radiusSmall,
    double? radiusMedium,
    double? radiusLarge,
    double? radiusExtraLarge,
    double? radiusFull,
  }) {
    return M3EShapes(
      radiusNone: radiusNone ?? this.radiusNone,
      radiusExtraSmall: radiusExtraSmall ?? this.radiusExtraSmall,
      radiusSmall: radiusSmall ?? this.radiusSmall,
      radiusMedium: radiusMedium ?? this.radiusMedium,
      radiusLarge: radiusLarge ?? this.radiusLarge,
      radiusExtraLarge: radiusExtraLarge ?? this.radiusExtraLarge,
      radiusFull: radiusFull ?? this.radiusFull,
    );
  }

  static M3EShapes lerp(M3EShapes a, M3EShapes b, double t) {
    return M3EShapes(
      radiusNone: _lerpDouble(a.radiusNone, b.radiusNone, t),
      radiusExtraSmall: _lerpDouble(a.radiusExtraSmall, b.radiusExtraSmall, t),
      radiusSmall: _lerpDouble(a.radiusSmall, b.radiusSmall, t),
      radiusMedium: _lerpDouble(a.radiusMedium, b.radiusMedium, t),
      radiusLarge: _lerpDouble(a.radiusLarge, b.radiusLarge, t),
      radiusExtraLarge: _lerpDouble(a.radiusExtraLarge, b.radiusExtraLarge, t),
      radiusFull: _lerpDouble(a.radiusFull, b.radiusFull, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) => a + (b - a) * t;
}
