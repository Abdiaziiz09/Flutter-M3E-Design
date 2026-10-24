// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:material_ui/material_ui.dart';
import '../theme/m3e_theme_extension.dart';

/// Concrete reference implementation for the M3E Split Button pattern.
///
/// Composes a primary action button and an independent menu trigger with
/// strict 48x48dp hit-target separation and distinct keyboard focus traversal.
class M3ESplitButton extends StatelessWidget {
  const M3ESplitButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.menuChildren,
    this.icon,
    this.isTonal = false,
  });

  final VoidCallback? onPressed;
  final Widget label;
  final List<Widget> menuChildren;
  final Widget? icon;
  final bool isTonal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final shapes = context.m3e.shapes;
    final spacing = context.m3e.spacing;

    final bg = isTonal ? colorScheme.secondaryContainer : colorScheme.primary;
    final fg = isTonal ? colorScheme.onSecondaryContainer : colorScheme.onPrimary;

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: shapes.borderFull,
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Primary Action Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.space16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      IconTheme(
                        data: IconThemeData(size: 20, color: fg),
                        child: icon!,
                      ),
                      SizedBox(width: spacing.space8),
                    ],
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: fg,
                            fontWeight: FontWeight.w700,
                          ),
                      child: label,
                    ),
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: fg.withValues(alpha: 0.2),
          ),
          // Independent Menu Trigger
          MenuAnchor(
            menuChildren: menuChildren,
            builder: (context, controller, child) {
              return Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(Icons.arrow_drop_down_rounded, color: fg),
                  tooltip: 'More actions',
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
