# Platform selection

Ask which products and inputs are in scope before choosing components. A shared Flutter codebase does not require an identical shell on every target.

| Context | Consider |
|---|---|
| Android touch | system bars, back behavior, IME, display scaling, TalkBack, dynamic color only where supported |
| iOS touch/tablet | safe areas, platform navigation, VoiceOver, text scaling, multitasking/resizing |
| Browser | keyboard/focus, browser history, zoom, viewport resizing, web semantics and screen readers |
| Windows desktop | resize, mouse/keyboard, focus/shortcuts, DPI, window controls |
| macOS desktop | resize, menu/keyboard conventions, VoiceOver, window chrome |
| Linux desktop | distribution/toolkit variability, keyboard/focus, packaging, portal/plugin capabilities |

Treat this as a checklist, not a promise of feature support. Verify using Flutter's current [supported platform documentation](https://docs.flutter.dev/reference/supported-platforms) and each platform's guide in this repository.
