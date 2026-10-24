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

## Sources and conflicts

Prefer current official Material guidance for design intent, Flutter API docs for Flutter behavior, and official platform docs for OS integration. Use the most specific applicable component/platform/version source. When authoritative sources conflict, state the discrepancy and avoid silently choosing a convenient claim. See [decision rules](docs/ai-agent-guide/design-decision-rules.md).

## Required completion note

Summarize files changed, platform/version tested, commands and actual outcomes, deviations or unsupported features, and remaining uncertainty. Follow [the implementation workflow](docs/ai-agent-guide/implementation-workflow.md).
