# Shape

Shape communicates grouping, hierarchy, and interaction. Material documents shape guidance and tokens at [Shape](https://m3.material.io/styles/shape/overview-principles). Flutter offers shapes through `ShapeBorder`, `OutlinedBorder`, `BorderRadius`, and component themes; the API's available shapes do not imply support for every expressive shape treatment or morph.

## Application

- Use component anatomy and the relevant official component page to choose a shape.
- Keep text-heavy surfaces legible and avoid decorative geometry that reduces usable content area.
- For nested surfaces, calculate inner geometry from the available padding and clipping requirements; do not blindly repeat a large parent radius.
- If a design requires morphing between shapes, implement it deliberately and validate continuity, hit testing, and reduced-motion behavior.

No numeric scale is asserted here because a value must be tied to a specific current source and token scope. See [Flutter custom components](../flutter/custom-components.md).

## Verification

Check corner consistency, clipping, nested padding, focus/pressed states, RTL, and visual appearance at relevant sizes.
