# AI agent guide

Use the repository-root `AGENTS.md` before implementation. This guide is the operational reference for applying the repository as a complete M3E design-system reference.

## Start here

**New to this repository?** Read in this order:

1. [`AGENTS.md`](../../AGENTS.md) — mandatory rules and error-handling scenarios
2. [M3E quick-start](m3e-quick-start.md) — complete step-by-step workflow for AI agents
3. [Getting started: scope](../getting-started/scope.md) — what M3E is and what it is not
4. [Design token registry](../foundations/design-token-registry.md) — every token with value, accessor, and evidence grade
5. [Component decision matrix](../components/component-decision-matrix.md) — which widget to use for each design intent

## Reference pages

- [M3E quick-start](m3e-quick-start.md) — complete agent workflow with code patterns
- [Implementation workflow](implementation-workflow.md) — step-by-step process checklist
- [Design decision rules](design-decision-rules.md) — authority order and conflict resolution
- [Platform selection](platform-selection.md) — Android, iOS, desktop considerations
- [Validation checklist](validation-checklist.md) — what to verify before submitting
- [Anti-patterns](anti-patterns.md) — what to avoid

## What agents must always report

Every implementation submission must include:

- Files changed and their purpose
- `flutter --version` output (exact)
- `material_ui` version from `pubspec.lock`
- Platforms tested with device/emulator names
- Actual output of `flutter analyze`, `flutter test`, `validate_docs.py`
- Confirmation that no magic numbers were used (or a list of labeled custom choices)
- Accessibility checks performed
- Known gaps, unverified items, and remaining limitations

Do not infer full M3 Expressive compliance from a theme flag, screenshot resemblance, or a community package name alone.
