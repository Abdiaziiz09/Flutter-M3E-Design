# Elevation and surfaces

Material 3 provides tonal surface roles; elevation and surface color are related design concepts but should not be treated as interchangeable. Flutter's [`ColorScheme`](https://api.flutter.dev/flutter/material/ColorScheme-class.html) documents surface and surface-container roles. Material's [elevation guidance](https://m3.material.io/styles/elevation/overview) is the design reference.

## Implementation

- Establish page, container, and overlay hierarchy using semantic surface roles.
- Use component elevation where it communicates layering and interaction; avoid arbitrary shadows as the sole hierarchy cue.
- Confirm modal surfaces, menus, sheets, and cards remain distinguishable in both themes.
- Do not assume that a selected elevation automatically derives the correct M3 Expressive surface color.

## Verification

Compare overlapping and non-overlapping surfaces, dark/light themes, high contrast settings, and platform rendering. Ensure overlays do not obscure important content or focus.
