import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3_expressive_reference_app/main.dart';

void main() {
  testWidgets('shows overview and switches to settings', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ReferenceApp());

    expect(find.text('Reference interface'), findsOneWidget);
    expect(find.text('Material 3 Flutter example'), findsOneWidget);

    await tester.tap(find.text('Settings').last);
    await tester.pumpAndSettle();

    expect(find.text('Example preference'), findsOneWidget);
    expect(tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value, isFalse);

    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle();

    expect(tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value, isTrue);
  });

  testWidgets('uses rail on a wide viewport', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1000, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const ReferenceApp());

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });
}
