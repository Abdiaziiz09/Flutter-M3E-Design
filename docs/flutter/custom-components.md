# Custom components

Extend Flutter only when the component requirements cannot be met by verified built-in widgets and themes.

## Strategy

1. Identify the exact visual/interaction gap and cite the source.
2. Prefer composing standard widgets (`Material`, `InkWell`, `Semantics`, layout, and animation primitives) over copying a framework component.
3. Keep component inputs semantic and theme-driven.
4. Preserve hit testing, keyboard focus, semantics, text scaling, RTL, and state feedback.
5. Add widget tests for states and accessibility properties, plus visual review for geometry and motion.

Do not reproduce official source assets unless the terms permit it. Do not imply that a community package is an official Google implementation. Assess maintenance, license, platform coverage, and version compatibility before adopting it.
