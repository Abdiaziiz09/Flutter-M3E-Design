# Support and implementation matrix

Use the same status vocabulary as the [component coverage matrix](component-coverage.md) and [verification ledger](component-verification-ledger.md): **API verified** means an API exists in the recorded local Flutter SDK, not that it conforms visually to Material guidance; **Composition only** means the need is assembled from primitives rather than a dedicated widget; **No direct API** means no equivalent stock widget is asserted; **Platform-dependent** means actual target integration/rendering must be checked; **Unverified** means the behavior or evidence is incomplete.

## Foundation and capability

| Capability | Flutter baseline | M3 Expressive interpretation | Notes |
|---|---|---|---|
| Material 3 theming | **API verified** | Not equivalent to all M3E guidance | `ThemeData.useMaterial3`; verify the chosen SDK and source version. |
| Semantic colors | **API verified** | Map roles and verify schemes | `ColorScheme`; exact current M3E palette must be independently sourced. |
| Typography | **API verified** | Role mapping possible; exact E variants not assumed | `TextTheme`; test scaling and fonts. |
| Standard components | **API verified** per component | Per-component expressive status varies | Check the component verification ledger; no universal E variant claim. |
| Expressive shape morphing | **Composition only / unverified** | Potential component-specific need | Verify design source, accessibility, and performance. |
| Dynamic color | **Platform-dependent** | Optional; no universal support | Package/OS-specific; test fallback and contrast. |
| Responsive/adaptive UI | **API verified** for layout primitives; **Composition only** for app behavior | Application decision required | Use constraints and task context, not a presumed universal breakpoint. |
| Accessibility | **Platform-dependent** | Required quality criterion | Test actual assistive technologies and targets. |

## Target platforms

| Target | Flutter target | System/native integration | Input and layout validation | M3E fidelity claim |
|---|---|---|---|---|
| Android | **Platform-dependent**; confirm current OS matrix | Conditional | touch, back, IME, system bars, TalkBack, large screens | Per-app verification |
| iOS | **Platform-dependent**; confirm current OS matrix | Conditional | touch, safe areas, VoiceOver, resizing/tablet | Per-app verification |
| Web | **Platform-dependent**; browser support varies | Browser-dependent | keyboard, focus, zoom, URL, screen readers, resize | Per-app verification |
| Windows | **Platform-dependent**; setup required | Plugin/OS-dependent | keyboard, pointer, DPI, resize, Narrator | Per-app verification |
| macOS | **Platform-dependent**; setup required | Plugin/OS-dependent | keyboard, pointer, window, VoiceOver | Per-app verification |
| Linux | **Platform-dependent**; distribution-dependent | Environment/plugin-dependent | keyboard, pointer, scaling, assistive tech | Per-app verification |

## Platform behavioral adaptation matrix

This matrix documents the implementation questions that must be resolved before claiming a design is "Expressive" on a given target.

| Platform | Primary interaction model | Required validation | Typical risk pattern | Decision rule |
|---|---|---|---|---|
| Android | touch + system chrome + TalkBack | edge-to-edge, IME, back navigation, high text, large screens | controls disappear under safe-area rules or overlap with system UI | prefer platform-appropriate safe-area and navigation behavior over forcing a desktop pattern |
| iOS | touch + VoiceOver + safe-area constraints | safe areas, Dynamic Type, navigation gestures, split-view resizing | labels truncate or action order becomes inconsistent | respect iOS reading direction and platform navigation semantics |
| Web | keyboard + pointer + browser resizing | focus rings, zoom, screen-reader labels, keyboard activation | hover-state visual affordance becomes the only state cue | ensure keyboard, pointer, and screen-reader states are all explicit |
| Windows | keyboard + pointer + DPI scaling | Narrator, focus order, resizing, DPI-aware layouts | control hit targets get too small or clip under DPI scaling | verify accessibility, focus, and scaling before claiming parity |
| macOS | keyboard + pointer + windows | VoiceOver, resizing, trackpad gestures, menu semantics | modal patterns become inconsistent across window sizes | test with standard pointer and keyboard expectations, not only touch |
| Linux | keyboard + pointer + desktop environment differences | focus visibility, scale factors, assistive-tech availability, window manager behavior | layouts feel correct on one desktop but fail on another | validate on the actual target environment rather than a generic Linux assumption |

This matrix is deliberately qualitative and should be used alongside the [platform guides](../platforms/index.md) and the [visual checklist](../ai-agent-guide/validation-checklist.md). It does not claim universal or identical Material rendering across all operating systems.

This matrix is deliberately qualitative. See Flutter's current [supported platforms](https://docs.flutter.dev/reference/supported-platforms) and the individual platform guides. It does not assert full component parity or identical rendering.
