# Theme configuration

Flutter's `ThemeData` constructor documents `useMaterial3`, `colorScheme`, typography, extensions, and component theme fields. Confirm the API at the app's selected SDK in [`ThemeData`](https://api.flutter.dev/flutter/material/ThemeData/ThemeData.html) and [`ColorScheme`](https://api.flutter.dev/flutter/material/ColorScheme-class.html).

```dart
import 'package:flutter/material.dart';

ThemeData buildTheme(Color seed, Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: brightness,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    visualDensity: VisualDensity.standard,
  );
}

MaterialApp(
  theme: buildTheme(const Color(0xFF6750A4), Brightness.light),
  darkTheme: buildTheme(const Color(0xFF6750A4), Brightness.dark),
  themeMode: ThemeMode.system,
  home: const HomePage(),
)
```

This code uses Flutter APIs documented in the current Flutter API and is a starting configuration, not an exact brand or M3E token set. Customize typography and component themes only when the design evidence calls for it. Avoid redundant legacy color properties when a semantic `ColorScheme` property expresses the intent.

Dynamic colors require a supported source and runtime fallback; see [color guidance](../foundations/color.md). Test custom scheme pairings for contrast.
