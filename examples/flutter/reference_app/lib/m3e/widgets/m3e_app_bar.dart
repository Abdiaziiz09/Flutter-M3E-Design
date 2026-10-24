// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:material_ui/material_ui.dart';
import '../theme/m3e_theme_extension.dart';

/// An Expressive App Bar implementing shortened responsive layout bounds,
/// expressive typography hierarchy, and adaptive action collapsing.
///
/// Designed to conform to M3 Expressive app bar specifications.
class M3EAppBar extends StatelessWidget implements PreferredSizeWidget {
  const M3EAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions = const [],
    this.centerTitle = false,
    this.shortenOnWide = true,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final List<Widget> actions;
  final bool centerTitle;
  final bool shortenOnWide;

  @override
  Size get preferredSize => Size.fromHeight(subtitle != null ? 72.0 : 64.0);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final typography = context.m3e.typography;
    final spacing = context.m3e.spacing;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720;

        Widget titleBlock = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: typography.titleLargeFlex.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
              child: title,
            ),
            if (subtitle != null) ...[
              SizedBox(height: spacing.space2),
              DefaultTextStyle(
                style: typography.bodySmallFlex.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                child: subtitle!,
              ),
            ],
          ],
        );

        // Shortened layout bounds on wide screens to prevent horizontal disconnect
        if (isWide && shortenOnWide) {
          titleBlock = ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: titleBlock,
          );
        }

        return AppBar(
          toolbarHeight: preferredSize.height,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
          scrolledUnderElevation: 3.0,
          leading: leading,
          title: titleBlock,
          centerTitle: centerTitle,
          actions: [
            ...actions,
            SizedBox(width: spacing.space8),
          ],
        );
      },
    );
  }
}
