# Spacing and layout

Material's layout guidance covers grids, spacing, breakpoints, scaffolds, and canonical layouts; see [layout overview](https://m3.material.io/foundations/layout/layout-overview/overview), [grids and spacing](https://m3.material.io/foundations/layout/grids-spacing/overview), and [breakpoints](https://m3.material.io/foundations/layout/breakpoints/overview). Flutter recommends adaptive and responsive design rather than assuming one fixed screen; see its [adaptive design guide](https://docs.flutter.dev/ui/adaptive-responsive).

## Practical rules

- Group related information and actions; use alignment and whitespace to communicate structure.
- Choose layout from available constraints and task needs, not device labels alone.
- Avoid fixed widths/heights that break under text scaling, translation, split-screen, or desktop resizing.
- Use logical directional padding and test RTL.
- Prefer Flutter constraints/layout widgets such as `LayoutBuilder`, `Wrap`, `Flexible`, and `Expanded` where appropriate; do not assume a universal breakpoint from M3 unless the specific source defines one.

Any locally selected breakpoint must be labeled an implementation decision and tested at the transition boundary.
