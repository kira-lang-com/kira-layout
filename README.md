<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/KiraLayoutBannerDark.png">
  <source media="(prefers-color-scheme: light)" srcset="Images/KiraLayoutBannerLight.png">
  <img alt="KiraLayout" src="Images/KiraLayoutBannerLight.png">
</picture>

# KiraLayout

A modern, type-safe layout engine for the Kira programming language. It provides a two-pass measurement and placement algorithm with flexible sizing modes, multiple arrangement strategies, and geometry utilities.

## Features

- **Two-Pass Algorithm**: Measure bottom-up, place top-down for predictable layout computation
- **Flexible Sizing**: Fixed, Fill, Hug, Fraction, Min, and Max sizing modes
- **Arrangement Strategies**: Stack, Grid, Wrap, Absolute, Overlay, and Fill layouts
- **Spacing Support**: Padding, margin, stack spacing, row spacing, and stretch alignment
- **Frame Inspection**: Retrieve final node frames from a measured and placed tree
- **Geometry Utilities**: Operations for Points, Sizes, Rects, and EdgeInsets

## Directory Structure

```text
app/
├── Primitives/       # Core geometry types
├── Layout/           # Descriptors, node/tree model, arrangement enums
├── Utils/            # Geometry helper functions
└── Engine/           # Two-pass layout engine and sizing helpers
```

## Quick Start

```bash
kira check
cd examples/small-layout-test
kira run
```

The example demonstrates geometry utilities and a real layout tree that runs through measurement and placement.

## Core Types

- **Point**: 2D coordinate
- **Size**: Width and height
- **Rect**: Origin plus size
- **EdgeInsets**: Top, trailing, bottom, and leading spacing
- **SizeMode**: Fixed, Fill, Hug, Fraction, Min, Max
- **ArrangeMode**: Stack, Absolute, Grid, Wrap, Overlay, Fill
- **LayoutNode**: Flat tree node with descriptor, measured size, placed origin, and child range
- **LayoutTree**: Executable node storage used by the layout engine

## Layout Engine

```kira
struct LayoutEngine {
    function measure(tree: LayoutTree, index: Int, available: Size) -> LayoutTree
    function place(tree: LayoutTree, index: Int, origin: Point) -> LayoutTree
}
```

`measure` and `place` return updated trees. This matches Kira's current value-oriented execution model and avoids relying on reference mutation for nested nodes.

## Example Output

```text
=====================================
  KIRA LAYOUT ENGINE - DEMO
=====================================

[ GEOMETRY ]
-------------------------------------
  Rect center and inset computed
  Geometry: ok

[ LAYOUT ENGINE ]
-------------------------------------
  Root fixed size: 240 x 160
  Measured size computed
  Stack, padding, margins, stretch, overlay all executed
  Measurement: ok

=====================================
  All demos completed successfully!
=====================================
```

## Implementation Notes

- `SizeMode.Fixed` and `SizeMode.Fill` resolve as outer sizes.
- `SizeMode.Hug`, `Min`, and `Max` include content plus padding.
- Stack, Absolute, Grid, Wrap, Overlay, and Fill are implemented in both measure and place.
- The tree is flat (`LayoutTree.nodes` plus `firstChild` / `childCount`) because current executable Kira does not accept empty array literals for leaf child lists.
- Integer-to-float layout math goes through the `intAsFloat` helper, now a single `Float(...)` numeric cast (the compiler gained `Int(...)`/`Float(...)` casts).

## License

Licensed under the Apache License, Version 2.0 ([LICENSE](LICENSE) or http://www.apache.org/licenses/LICENSE-2.0).
