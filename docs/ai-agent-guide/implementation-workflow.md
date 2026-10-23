# Implementation workflow for coding agents

1. **Read instructions:** root `AGENTS.md`, scope, support matrix, and relevant component/foundation pages.
2. **Establish target:** Flutter version, platforms, viewport/window sizes, input methods, localization/RTL, accessibility needs, and existing architecture.
3. **Extract requirements:** list official design requirements, Flutter facts, application requirements, and unknowns separately. Link sources.
4. **Check capability:** verify candidate widget constructors and properties in API docs for the selected SDK. Classify each requirement built-in, configurable, custom, platform-specific, or unverified.
5. **Design composition:** choose semantic color/type/surface roles, responsive structure, navigation, and interaction states. Mark local decisions explicitly.
6. **Implement:** reuse existing widgets and project patterns; add custom behavior only for documented gaps. Preserve accessibility and platform conventions.
7. **Test:** run analyzer, unit/widget/integration tests as applicable; inspect light/dark, input states, text scaling, RTL, resize, and target platform behavior.
8. **Review evidence:** compare against relevant official guidance and source assets. Record gaps and any inaccessible or ambiguous source.
9. **Report:** summarize files, decisions, sources, versions, executed commands and exact outcomes, visual/platform checks, and remaining limitations.

If authoritative sources conflict, follow [decision rules](design-decision-rules.md). Do not fabricate confidence or convert an unverified behavior into a requirement.
