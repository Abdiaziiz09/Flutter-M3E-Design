# Android

Flutter renders Material widgets within its app surface; do not assume Flutter automatically adopts every Android system or native Material implementation behavior.

- Follow Flutter's [Android setup](https://docs.flutter.dev/platform-integration/android) and target SDK guidance.
- Account for system bars, edge-to-edge behavior, display cutouts, keyboard/IME, back navigation, and lifecycle.
- Dynamic wallpaper color is OS-version dependent; verify API and plugin support, permissions, fallback, and contrast.
- Test touch, TalkBack, font/display scaling, rotation, multi-window, and large screens.
- Check app lifecycle and system UI configuration against the currently supported Android documentation.

Use Material guidance for shared component design and Android guidance for OS integration. Test on representative Android versions and screen sizes.
