# Accessibility

Accessibility is part of the interface specification, not a final polish pass. Follow Material's [building for all user needs](https://m3.material.io/foundations/building-for-all/user-needs) guidance, Flutter's [accessibility documentation](https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility), and applicable WCAG criteria for web content.

- Use semantic controls and meaningful labels; test with platform screen readers.
- Preserve text scaling and avoid truncating essential information.
- Verify foreground/background contrast, including custom and dynamic colors.
- Make focus visible and keyboard navigation complete on web and desktop.
- Support touch, pointer, keyboard, and switch/assistive input as relevant.
- Do not rely only on color, motion, or shape to convey state.
- Ensure dialogs, menus, sheets, and validation errors announce and manage focus correctly.

Platform accessibility conventions differ; see each platform guide and run manual assistive-technology checks.
