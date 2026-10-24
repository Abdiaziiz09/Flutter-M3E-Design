# Motion

Material's [motion guidance](https://m3.material.io/styles/motion/overview/how-it-works) describes motion as a way to explain relationships and transitions. M3 Expressive material may specify particular expressive behaviors; verify the exact component source rather than transferring a motion behavior to every widget. Flutter offers animation primitives and transitions, but Flutter's general Material 3 setting does not establish support for all M3 Expressive motion.

## Implementation

- Animate a meaningful state or spatial relationship; avoid motion that delays task completion or distracts.
- Use Flutter's animation APIs with explicit lifecycle, interruption, and disposal behavior.
- Avoid unsupported claims about spring parameters or durations. If the official applicable source does not prescribe a value, label the chosen timing/curve as a design decision.
- Respect accessibility settings and provide a reduced-motion alternative when motion is nonessential.
- Ensure color/opacity transitions do not create unreadable intermediate states.

Common and defensible implementation guidance:

- Prefer short, purposeful transitions for state changes; avoid a default global animation that is visually busy.
- Use `Curve` values that communicate intent, but do not claim a specific M3 Expressive curve unless the current source is explicit.
- Keep motion reversible and interruptible: a user action should not leave the UI in a half-transition state.
- For reduced-motion preferences, provide a near-instant or subtle fade/scale alternative while preserving state clarity.

Example pattern:

```dart
TweenAnimationBuilder<double>(
  tween: Tween(begin: 0.0, end: 1.0),
  duration: const Duration(milliseconds: 220),
  curve: Curves.easeOutCubic,
  builder: (context, value, child) {
    return Transform.scale(scale: value, child: child);
  },
  child: const SizedBox.square(dimension: 48),
);
```

This example is a reusable Flutter pattern, not an official M3 Expressive timing contract. Validate actual duration, easing, and reduced-motion behavior against the applicable component source and the target platform.

See [Flutter animation guidance](../flutter/animations.md). Validate enter/exit, rapid repeated input, route changes, reduced motion, and frame performance.
