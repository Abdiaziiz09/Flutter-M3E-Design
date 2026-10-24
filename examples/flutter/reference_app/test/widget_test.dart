// Copyright 2026 The Flutter M3E Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3_expressive_reference_app/main.dart';

void main() {
  testWidgets('shows overview and switches to settings', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ReferenceApp());

    expect(find.text('Reference interface'), findsOneWidget);
    expect(find.text('Material 3 Flutter example'), findsOneWidget);

    await tester.tap(find.text('Settings').first);
    await tester.pumpAndSettle();

    expect(find.text('Example preference'), findsOneWidget);
    final exampleSwitch = find.byKey(const ValueKey('example-preference-switch'));
    expect(tester.widget<SwitchListTile>(exampleSwitch).value, isFalse);

    await tester.tap(exampleSwitch);
    await tester.pumpAndSettle();

    expect(tester.widget<SwitchListTile>(exampleSwitch).value, isTrue);
  });

  testWidgets('uses rail on a wide viewport', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1000, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ReferenceApp());

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });
}
