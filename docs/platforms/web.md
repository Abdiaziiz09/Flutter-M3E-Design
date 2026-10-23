# Web

Flutter web output is a web application, but browser semantics, accessibility, keyboard behavior, URL navigation, and responsive viewport behavior require explicit validation.

- Follow Flutter's [web deployment](https://docs.flutter.dev/platform-integration/web) and accessibility guidance.
- Test keyboard-only navigation, focus visibility, screen readers, browser zoom, text scaling, narrow viewports, and resizing.
- Use adaptive navigation and layouts instead of forcing a mobile-only shell into desktop browser space.
- Test browser back/forward, deep links, refresh behavior, and loading/error states.
- Validate performance and rendering in supported browsers; Flutter rendering and DOM-based web content do not have identical accessibility characteristics.

Use semantic Flutter widgets and test accessibility with actual browser/screen-reader combinations.
