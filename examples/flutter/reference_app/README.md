# Flutter reference example

This small app demonstrates Flutter Material 3 theming, system light/dark selection, and a project-specific adaptive navigation layout. It is a compilable reference for the documentation, not a claim of complete Material 3 Expressive fidelity.

## Run and validate

```bash
flutter pub get
flutter run -d chrome
flutter analyze
flutter test
flutter build web
```

The example's navigation switches at a locally chosen width threshold. That number is an implementation decision for this sample, not a Material breakpoint token. Replace it with project-specific, tested behavior in production. The app has not been validated on every documented platform.
