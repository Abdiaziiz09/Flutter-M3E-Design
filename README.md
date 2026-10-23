# Material 3 Expressive for Flutter: verified implementation guide

This repository is an independent, source-traceable guide to implementing interfaces informed by Material 3 Expressive (M3 Expressive) with Flutter. It is a practical reference, not an official Google or Flutter specification and not a certification of conformance.

## What this repository covers

- M3 Expressive design intent and its relationship to Material 3.
- Foundations, component selection, Flutter Material theming, and custom implementation decisions.
- Flutter targets: Android, iOS, web, Windows, macOS, and Linux, with platform-specific limitations called out.
- Responsive and adaptive layouts, accessibility, testing, and AI-agent workflows.

Flutter's Material library implements Material Design components and theming. Setting `ThemeData.useMaterial3` selects Flutter's Material 3 behavior; it does **not** prove that every M3 Expressive component, motion treatment, or platform behavior is implemented. Use the support matrix and component catalog to determine whether a requirement is built in, configurable, custom, or unverified.

## Quick start

1. Read [the definition and scope](docs/getting-started/scope.md), [support matrix](docs/reference/support-matrix.md), and [AI agent instructions](AGENTS.md).
2. Identify the target Flutter version, platforms, input modes, accessibility needs, and relevant components.
3. Follow the related foundation and component pages; distinguish source-backed guidance from repository recommendations.
4. Implement with Flutter's built-in Material widgets where they satisfy the requirement. Add custom work only for a verified gap.
5. Run the visual and accessibility checks in the [validation checklist](docs/ai-agent-guide/validation-checklist.md), plus available automated tests.
6. Record unsupported behavior and evidence. Never claim complete M3 Expressive compliance without a defined and verified scope.

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
  ),
  home: const MyHomePage(),
)
```

This is a Material 3 Flutter starting point, not an M3 Expressive compliance recipe. In production, define light/dark schemes, typography and component themes deliberately; validate the resulting UI against applicable M3 Expressive guidance.

## Documentation map

| Topic | Start here |
|---|---|
| Scope, evidence labels, and quick setup | [Getting started](docs/getting-started/scope.md) |
| Foundations: color, type, shape, layout, motion, accessibility | [Foundations index](docs/foundations/index.md) |
| Component catalog and coverage | [Components index](docs/components/index.md) |
| Flutter architecture, theme, custom widgets, tests | [Flutter guide](docs/flutter/index.md) |
| Android, iOS, web, Windows, macOS, Linux | [Platform guidance](docs/platforms/index.md) |
| Reusable screen recipes | [Design recipes](docs/design-recipes/index.md) |
| AI coding-agent workflow | [AGENTS.md](AGENTS.md) and [agent guide](docs/ai-agent-guide/index.md) |
| Source provenance and compatibility | [Verified source catalog](docs/reference/official-sources.md), [support matrix](docs/reference/support-matrix.md) |
| Contribution and issue reporting | [CONTRIBUTING.md](CONTRIBUTING.md) |
| GitHub Pages publishing | [Publishing guide](docs/reference/publishing.md) |

## Official starting points

- [Material Design](https://m3.material.io/)
- [Material 3 Expressive blog: Building with M3 Expressive](https://m3.material.io/blog/building-with-m3-expressive)
- [Material Design usability guidance](https://m3.material.io/foundations/usability/overview)
- [Flutter Material design](https://docs.flutter.dev/ui/design/material)
- [Flutter adaptive and responsive design](https://docs.flutter.dev/ui/adaptive-responsive)
- [Flutter `ThemeData` API](https://api.flutter.dev/flutter/material/ThemeData/ThemeData.html)

## How evidence is presented

Pages separate **official guidance** (directly supported by cited primary sources), **Flutter fact** (documented API or behavior), and **implementation recommendation** (a reasoned choice where official guidance does not prescribe an implementation). Source availability and version are recorded in the [source catalog](docs/reference/official-sources.md). Exact values are included only where their source and scope are clear. Some Material pages render as a web application and may not expose all content to text-only retrieval; absence from this repository does not mean the design source has no guidance.

## Project status and limitations

This is an independent documentation project. Material 3 Expressive guidance and platform implementations evolve. The source catalog was reviewed on 2026-10-23 where access is explicitly noted; re-check upstream sources before shipping. Flutter examples target the SDK available during repository validation and are not guarantees for earlier SDKs. Visual fidelity must be checked on each target platform and accessibility configuration.

The original source list is preserved and expanded in [link_sources.md](link_sources.md). To report an inaccuracy or propose a source-backed change, open a GitHub issue using the templates, or follow [contribution guidance](CONTRIBUTING.md). The repository intentionally makes no claim of universal or 100% compliance.

## Build and validate the documentation

```bash
python -m pip install -r requirements.txt
python scripts/validate_docs.py
python scripts/validate_links.py
mkdocs build --strict
```

For the standalone Flutter reference example, run `flutter pub get`, `flutter analyze`, and `flutter test` from `examples/flutter/reference_app/`. See the [validation guide](docs/flutter/testing.md). External link validation is optional because network access may block requests.

## License

Documentation and original examples are licensed under the MIT License; see [LICENSE](LICENSE). Third-party names, specifications, and linked resources remain subject to their respective owners' terms. No Material Design artwork or proprietary assets are redistributed here.
