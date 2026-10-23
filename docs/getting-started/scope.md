# Scope, terminology, and evidence

## What M3 Expressive means

**Official guidance:** Material 3 Expressive is a design direction within the Material 3 system. Material describes expressive guidance as helping products create more engaging, usable experiences through design tactics that can draw attention to important information and actions. It is not a separate Flutter rendering engine or a promise that all components have an expressive variant. See the [M3 Expressive blog](https://m3.material.io/blog/building-with-m3-expressive) and [usability guidance](https://m3.material.io/foundations/usability/overview).

**Material 3** provides a broader design system, including color roles, typography, shape, motion, layout, and component guidance. M3 Expressive applies additional or revised tactics and component guidance in selected areas. Do not label ordinary M3 defaults as expressive merely because they use a Material 3 theme.

## Flutter relationship

Flutter's `package:flutter/material.dart` contains Material widgets and theming APIs. `ThemeData.useMaterial3` selects Flutter's Material 3 styling behavior. `ThemeData`, `ColorScheme`, `TextTheme`, and per-component theme data allow configuration. These APIs do not certify that M3 Expressive-only component flexibility, motion, shape morphing, or Android behavior is present.

Classify implementation needs:

- **Built in:** a Flutter Material widget and behavior directly satisfy the verified requirement.
- **Configurable:** built-in widget supports the requirement through its documented theme or properties.
- **Custom:** no verified built-in option satisfies the requirement; implement and test a focused extension.
- **Platform-specific:** use a supported OS API/plugin or conditional integration; document fallback behavior.
- **Unverified:** source or API evidence is insufficient. Do not assert support.

Android's system UI and platform-level Material implementations are not identical to Flutter's cross-platform widget rendering. On iOS, web, Windows, macOS, and Linux, preserve the product's design language while respecting platform input, window, accessibility, and integration conventions.

## Evidence labels

Use these labels in technical documentation:

- **Material guidance:** directly supported by an official Material source.
- **Flutter fact:** documented Flutter API or official Flutter guidance.
- **Platform fact:** documented by the platform vendor or standards body.
- **Implementation recommendation:** a deliberate local choice, not a prescribed token or requirement.
- **Unverified:** evidence unavailable, ambiguous, or inaccessible during review.

When a source does not publish a value, state "not specified in the cited source." Never substitute a plausible number. Cite a versioned API page when behavior depends on Flutter releases.

## Limits

This repository is not published by Google, Flutter, Apple, Microsoft, or any platform vendor. It does not reproduce proprietary design assets. It provides no guarantee of full conformance, compatibility with every SDK, or identical rendering across platforms.
