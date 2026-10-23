# Source catalog

Reviewed 2026-10-23 where access status says **Verified**. "Verified" means the URL resolved and its title or relevant API content was inspected; it does not mean every page detail was extracted. Material Design uses interactive pages, and some could not be retrieved in text. Re-check upstream before relying on version-sensitive claims.

## Material 3 Expressive and Material Design

| Title | Publisher / category | URL | Supports | Status and limitations |
|---|---|---|---|---|
| Material Design | Google / Material home | https://m3.material.io/ | Canonical design system entry | URL present in supplied source list; individual page content not fully inspected. |
| M3 Expressive: Engaging UX Design | Google / M3E blog | https://m3.material.io/blog/building-with-m3-expressive | M3E framing and design intent | Page title/metadata retrieved; article body not reliably available in text. |
| Usability | Google / foundation | https://m3.material.io/foundations/usability/overview | Usability and expressive design intent | Metadata retrieved; full body not available in text. |
| Color roles | Google / foundation | https://m3.material.io/styles/color/roles | Material semantic color guidance | URL retained from supplied source list; interactive content not fully inspected. |
| Typography | Google / foundation | https://m3.material.io/styles/typography/overview | Typography system | URL retained; exact token values not asserted. |
| Shape principles | Google / foundation | https://m3.material.io/styles/shape/overview-principles | Shape guidance | URL retained; exact scale not asserted. |
| Elevation | Google / foundation | https://m3.material.io/styles/elevation/overview | Elevation concepts | URL retained; exact values not asserted. |
| Motion overview | Google / foundation | https://m3.material.io/styles/motion/overview/how-it-works | Motion concepts | Fetch failed in this environment; unverified on review date. |
| Layout overview | Google / foundation | https://m3.material.io/foundations/layout/layout-overview/overview | Layout guidance | URL retained; details not numerically asserted. |

## Flutter

| Title | Publisher / category | URL | Supports | Status and limitations |
|---|---|---|---|---|
| Material Design for Flutter | Flutter / guide | https://docs.flutter.dev/ui/design/material | Flutter Material overview | Verified; page reported Flutter 3.47 content and 2026-09 update. |
| Adaptive and responsive design | Flutter / guide | https://docs.flutter.dev/ui/adaptive-responsive | Responsive/adaptive definitions and input context | Verified; page reported Flutter 3.47 content. |
| ThemeData constructor | Flutter API | https://api.flutter.dev/flutter/material/ThemeData/ThemeData.html | Theme constructor properties including `useMaterial3` | Verified API listing; API evolves with Flutter releases. |
| ColorScheme | Flutter API | https://api.flutter.dev/flutter/material/ColorScheme-class.html | Flutter color roles and Material 3 surfaces | Verified API page. |
| Testing Flutter apps | Flutter / guide | https://docs.flutter.dev/testing | Unit/widget/integration testing | Official source; check current version before use. |
| Accessibility and internationalization | Flutter / guide | https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility | Flutter accessibility guidance | URL recorded; exact current page content not retrieved. |
| Supported platforms | Flutter / reference | https://docs.flutter.dev/reference/supported-platforms | Flutter platform support | Official source; verify current platform/OS versions. |
| Platform integration | Flutter / guide | https://docs.flutter.dev/platform-integration | Native platform integration and setup | Verified overview. |

## Packages and implementation repositories

| Title | Publisher / category | URL | Supports | Status and limitations |
|---|---|---|---|---|
| dynamic_color | Flutter community package / pub.dev | https://pub.dev/packages/dynamic_color | Package-documented dynamic color integrations | Verified package page; third-party, version/platform support may change. Not an official M3E specification. |
| material_3_expressive | paadevelopments / community implementation | https://github.com/paadevelopments/material_3_expressive | Example Flutter implementation claims and package code | Page retrieved; non-normative and not official. |
| m3_expressive | fabric-apps / community implementation | https://github.com/fabric-apps/m3_expressive | Example custom Flutter components | Page retrieved; non-normative and not official. |

## Platform, accessibility, web, and testing

Use current official references for [Android](https://developer.android.com/design/ui), [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/), [Microsoft Fluent design](https://learn.microsoft.com/windows/apps/design/), [W3C WCAG](https://www.w3.org/TR/WCAG22/), and [Flutter platform integration](https://docs.flutter.dev/platform-integration). These were identified as authoritative starting points but their detailed claims were not individually verified in this review; consult the target platform and current version directly.

## Preserved starting URLs

The full originally supplied list is preserved in the repository-root `link_sources.md`. A listed URL is not automatically a verified source; this catalog marks access limits explicitly.
