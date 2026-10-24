# Instructions for AI coding agents

Use this repository as an independent implementation reference, not as an official specification or a guarantee of conformance.

## Before changing UI

1. Read [scope and terminology](docs/getting-started/scope.md), [support matrix](docs/reference/support-matrix.md), and the applicable sections of this guide.
2. Identify framework, Flutter version, target platforms, viewport/window behavior, input devices, localization/RTL needs, and accessibility requirements.
3. Read the relevant foundation and component pages, then check their primary-source references and version notes.
4. Separate official M3 guidance from Flutter API facts and this repository's implementation recommendations.
5. For component scope and evidence status, consult the [38-entry inventory](docs/reference/m3e-master-component-inventory.csv), [source-evidence ledger](docs/reference/m3e-source-evidence-ledger.csv), and [Phase 0/1 audit](docs/reference/m3e-phase0-1-audit.md). Do not treat a listed API or a documentation-readiness score as proof of M3E conformance.

## Implementation rules

- Do not equate `useMaterial3: true` with full M3 Expressive implementation.
- Reuse Flutter Material widgets when verified behavior meets the requirement. Build custom widgets only for a documented gap.
- Prefer semantic `ColorScheme` roles and theme configuration over scattered hard-coded colors.
- Do not invent design tokens, dimensions, timing, state behavior, or support claims. Label application-specific decisions.
- Respect text scaling, semantic labels, keyboard/focus behavior, contrast, pointer and touch input, responsive layouts, and RTL.
- Test relevant component states and each available target platform. Report what was not tested.
- Never claim full compliance without a defined scope, source evidence, and visual/accessibility validation.

## Negative constraints and guardrails

The following are explicit non-goals and anti-patterns. If a requirement is not supported by a direct Material Design page, current Flutter API, or a clearly documented project decision, do not infer it.

- Do not assume a baseline Material 3 component is automatically an M3 Expressive component.
- Do not copy a component shape, elevation, or animation solely because it looks similar in a reference image; verify the source and platform API.
- Do not treat a screenshot resemblance, theme flag, or component family name as proof of matching anatomy, tokens, or motion.
- Do not claim a component "supports" a state that the current Flutter API or source page does not document unless you confirm it in the target SDK.
- Do not use hard-coded colors, radii, spacing, or timing values when a semantic theme or composition rule is available.
- Do not ignore large text, reduced-motion settings, keyboard focus, or RTL/localization as secondary concerns.
- Do not claim a design is fully compliant without recording the scope, tested target platforms, and unresolved risks.
- Do not recommend a deprecated or migration-sensitive API without documenting why it remains necessary for the supported SDK range.

## Required completion note

Summarize files changed, platform/version tested, commands and actual outcomes, deviations or unsupported features, and remaining uncertainty. Follow [the implementation workflow](docs/ai-agent-guide/implementation-workflow.md).

## Sources and conflicts

Prefer current official Material guidance for design intent, Flutter API docs for Flutter behavior, and official platform docs for OS integration. Use the most specific applicable component/platform/version source. When authoritative sources conflict, state the discrepancy and avoid silently choosing a convenient claim. See [decision rules](docs/ai-agent-guide/design-decision-rules.md).

## Required completion note

Summarize files changed, platform/version tested, commands and actual outcomes, deviations or unsupported features, and remaining uncertainty. Follow [the implementation workflow](docs/ai-agent-guide/implementation-workflow.md).
