# Theming

Flutter theming is a configurable Material implementation surface, not a substitute for M3 Expressive design review.

1. Define light and dark `ColorScheme`s.
2. Define `TextTheme` roles and font fallbacks.
3. Configure component themes only for shared, intentional changes.
4. Use semantic color and shape roles in custom widgets.
5. Test all themes, states, text scaling, and platform targets.

See [Flutter theme configuration](../flutter/theme-configuration.md), [color](../foundations/color.md), [typography](../foundations/typography.md), and [surfaces](../foundations/elevation-and-surfaces.md). Exact token values should be traced to the source; this repository does not define a new token system.
