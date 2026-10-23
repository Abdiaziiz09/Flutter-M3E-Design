# Support and implementation matrix

Status meanings: **Built in** = Flutter has a relevant standard API; **Configurable** = standard API can be themed/adapted; **Custom** = requirement may need custom UI; **Platform-dependent** = requires per-platform validation/integration; **Unverified** = no completeness claim.

## Foundation and capability

| Capability | Flutter baseline | M3 Expressive interpretation | Notes |
|---|---|---|---|
| Material 3 theming | Built in / configurable | Not equivalent to all M3E guidance | `ThemeData.useMaterial3`; API/version dependent. |
| Semantic colors | Built in / configurable | Map roles and verify schemes | `ColorScheme`; exact current M3E palette must be independently sourced. |
| Typography | Built in / configurable | Role mapping possible; exact E variants not assumed | `TextTheme`; test scaling and fonts. |
| Standard components | Built in / configurable | Per-component expressive status varies | Check component docs; no universal E variant claim. |
| Expressive shape morphing | Custom / unverified | Potential component-specific need | Verify design source, accessibility, and performance. |
| Dynamic color | Platform-dependent | Optional; no universal support | Package/OS-specific; test fallback and contrast. |
| Responsive/adaptive UI | Built in framework tools | Application decision required | Use constraints and task context, not a presumed universal breakpoint. |
| Accessibility | Platform-dependent | Required quality criterion | Test actual assistive technologies and targets. |

## Target platforms

| Target | Flutter target | System/native integration | Input and layout validation | M3E fidelity claim |
|---|---|---|---|---|
| Android | Flutter supported; confirm current OS matrix | Conditional | touch, back, IME, system bars, TalkBack, large screens | Per-app verification |
| iOS | Flutter supported; confirm current OS matrix | Conditional | touch, safe areas, VoiceOver, resizing/tablet | Per-app verification |
| Web | Flutter supported; browser support varies | Browser-dependent | keyboard, focus, zoom, URL, screen readers, resize | Per-app verification |
| Windows | Flutter desktop target; setup required | Plugin/OS-dependent | keyboard, pointer, DPI, resize, Narrator | Per-app verification |
| macOS | Flutter desktop target; setup required | Plugin/OS-dependent | keyboard, pointer, window, VoiceOver | Per-app verification |
| Linux | Flutter desktop target; distribution-dependent | Environment/plugin-dependent | keyboard, pointer, scaling, assistive tech | Per-app verification |

This matrix is deliberately qualitative. See Flutter's current [supported platforms](https://docs.flutter.dev/reference/supported-platforms) and the individual platform guides. It does not assert full component parity or identical rendering.
