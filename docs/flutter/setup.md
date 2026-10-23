# Flutter setup and version policy

Flutter applications target different frameworks/platforms from a shared codebase, but each target has distinct setup, plugins, behavior, and accessibility considerations. See [Flutter installation](https://docs.flutter.dev/get-started/install), [supported platforms](https://docs.flutter.dev/reference/supported-platforms), and [platform integration](https://docs.flutter.dev/platform-integration).

## Requirements

- Use a currently supported stable Flutter release compatible with the app's dependencies and deployment targets.
- Record `flutter --version` in issue reports and validation results.
- Pin dependency constraints intentionally; do not copy version numbers from this documentation without checking pub.dev/API compatibility.
- Configure platform build tools separately (Android SDK, Xcode for Apple targets, and desktop toolchains as required).

## Create and validate

```bash
flutter create my_app
cd my_app
flutter analyze
flutter test
```

Add Material theming only after checking [ThemeData configuration](theme-configuration.md). Build target setup instructions are maintained by Flutter and platform vendors; this repository does not replace them.
