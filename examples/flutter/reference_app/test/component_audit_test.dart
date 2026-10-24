import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3_expressive_reference_app/main.dart';

void main() {
  for (final brightness in Brightness.values) {
    for (final viewport in <({String name, Size size})>[
      (name: 'narrow', size: const Size(390, 844)),
      (name: 'wide', size: const Size(1000, 800)),
    ]) {
      testWidgets(
        'overview ${brightness.name} ${viewport.name} golden',
        (tester) async {
          await tester.binding.setSurfaceSize(viewport.size);
          addTearDown(() => tester.binding.setSurfaceSize(null));

          await tester.pumpWidget(_auditApp(brightness));
          await expectLater(
            find.byType(ReferenceHomePage),
            matchesGoldenFile(
              'goldens/overview_${brightness.name}_${viewport.name}.png',
            ),
          );
        },
      );
    }
  }

  for (final brightness in Brightness.values) {
    testWidgets('search ${brightness.name} narrow golden', (tester) async {
      await tester.binding.setSurfaceSize(const Size(390, 844));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(_auditApp(brightness));
      await tester.tap(find.text('Search').first);
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ReferenceHomePage),
        matchesGoldenFile('goldens/search_${brightness.name}_narrow.png'),
      );
    });
  }

  testWidgets('segmented selection and disabled controls expose state', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();

    String selected = 'Week';
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => Column(
              children: [
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'Day', label: Text('Day')),
                    ButtonSegment(value: 'Week', label: Text('Week')),
                  ],
                  selected: {selected},
                  onSelectionChanged: (selection) =>
                      setState(() => selected = selection.first),
                ),
                const FilledButton(onPressed: null, child: Text('Unavailable')),
              ],
            ),
          ),
        ),
      ),
    );

    expect(selected, 'Week');
    await tester.tap(find.text('Day'));
    await tester.pumpAndSettle();
    expect(selected, 'Day');
    expect(
      tester.getSemantics(find.text('Unavailable')),
      matchesSemantics(
        isButton: true,
        hasEnabledState: true,
        isEnabled: false,
        label: 'Unavailable',
      ),
    );
    semantics.dispose();
  });

  testWidgets('focus traversal and keyboard activate a button', (tester) async {
    final firstFocus = FocusNode();
    final secondFocus = FocusNode();
    addTearDown(firstFocus.dispose);
    addTearDown(secondFocus.dispose);
    var activated = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: FocusTraversalGroup(
            child: Column(
              children: [
                TextButton(
                  focusNode: firstFocus,
                  onPressed: () {},
                  child: const Text('First action'),
                ),
                FilledButton(
                  focusNode: secondFocus,
                  onPressed: () => activated = true,
                  child: const Text('Second action'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    firstFocus.requestFocus();
    await tester.pump();
    expect(firstFocus.hasFocus, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    expect(secondFocus.hasFocus, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(activated, isTrue);
  });

  testWidgets('form validation shows an error message', (
    tester,
  ) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const ValueKey('required-field'),
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter a name' : null,
                ),
                FilledButton(
                  onPressed: () => formKey.currentState!.validate(),
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a name'), findsOneWidget);
  });

  testWidgets('menu opens, selects an item, and closes', (tester) async {
    String? chosen;
    final controller = MenuController();
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: MenuAnchor(
            controller: controller,
            menuChildren: [
              MenuItemButton(
                onPressed: () => chosen = 'Edit',
                child: const Text('Edit'),
              ),
            ],
            builder: (context, controller, child) => TextButton(
              onPressed: controller.open,
              child: const Text('Open actions'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open actions'));
    await tester.pumpAndSettle();
    expect(controller.isOpen, isTrue);
    expect(find.text('Edit'), findsOneWidget);
    await tester.tap(find.text('Edit'));
    await tester.pumpAndSettle();
    expect(chosen, 'Edit');
    expect(controller.isOpen, isFalse);
    expect(find.text('Edit'), findsNothing);
  });

  testWidgets('date picker uses the configured English Material locale', (
    tester,
  ) async {
    Locale observedLocale = const Locale('und');
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () {
                observedLocale = Localizations.localeOf(context);
                showDatePicker(
                  context: context,
                  initialDate: DateTime(2024, 2, 15),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
              },
              child: const Text('Choose date'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Choose date'));
    await tester.pumpAndSettle();
    expect(observedLocale.languageCode, 'en');
    expect(find.text('February 2024'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsNothing);
  });
}

Widget _auditApp(Brightness brightness) {
  ThemeData createTheme(Brightness themeBrightness) => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: themeBrightness,
        ),
        visualDensity: VisualDensity.standard,
        cardTheme: CardThemeData(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );

  return MaterialApp(
    theme: createTheme(Brightness.light),
    darkTheme: createTheme(Brightness.dark),
    themeMode:
        brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
    home: const ReferenceHomePage(),
  );
}
