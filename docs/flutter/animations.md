# Flutter animation

Flutter's animation framework provides controllers, implicit animations, and transition widgets; see [Flutter animation documentation](https://docs.flutter.dev/ui/animations). The existence of these APIs does not guarantee that an animation matches a particular M3 Expressive spec.

- Use an implicit animation for simple property changes where it meets the specification.
- Use an explicit controller for coordinated sequences, interruption, and lifecycle control.
- Dispose controllers and ensure state changes do not leave animations running.
- Keep motion tied to user feedback or spatial continuity.
- Provide an accessible alternative for nonessential motion and test operating-system reduced-motion preferences where supported.
- Do not present arbitrary duration, curve, or spring values as Material tokens.

Measure frame behavior on representative hardware and test rapid interactions, route changes, and app lifecycle interruptions.
