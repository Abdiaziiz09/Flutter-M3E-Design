# Motion

Material's [motion guidance](https://m3.material.io/styles/motion/overview/how-it-works) describes motion as a way to explain relationships and transitions. M3 Expressive material may specify particular expressive behaviors; verify the exact component source rather than transferring a motion behavior to every widget. Flutter offers animation primitives and transitions, but Flutter's general Material 3 setting does not establish support for all M3 Expressive motion.

## Implementation

- Animate a meaningful state or spatial relationship; avoid motion that delays task completion or distracts.
- Use Flutter's animation APIs with explicit lifecycle, interruption, and disposal behavior.
- Avoid unsupported claims about spring parameters or durations. If the official applicable source does not prescribe a value, label the chosen timing/curve as a design decision.
- Respect accessibility settings and provide a reduced-motion alternative when motion is nonessential.
- Ensure color/opacity transitions do not create unreadable intermediate states.

See [Flutter animation guidance](../flutter/animations.md). Validate enter/exit, rapid repeated input, route changes, reduced motion, and frame performance.
