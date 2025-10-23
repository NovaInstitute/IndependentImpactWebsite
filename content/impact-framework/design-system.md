---
title: "Design System"
slug: "design-system"
description: "Shared palettes, typography, and component patterns keep the Independent Impact experience consistent across marketing and product surfaces."
layout: "feature"
badge: "Interface"
badgeColor: "#1e88e5"
aliases:
  - /features/design-system/
features:
  - title: "Accessible colour tokens"
    description: "CSS variables and Tailwind aliases define brand, surface, and state colours that pass contrast guidelines across light and dark modes."
  - title: "Flexible typography scale"
    description: "Inter and Plus Jakarta Sans power a modern type system with responsive utilities for headings, body copy, and UI accents."
  - title: "Reusable component styles"
    description: "Buttons, cards, navigation, and CTAs inherit shared Tailwind layers, ensuring any new section drops into the site with minimal overrides."
  - title: "Dark-mode ready foundations"
    description: "Theme tokens include dark-surface variants, letting future product surfaces toggle appearance without rewriting component logic."
---

## Foundations

Independent Impact’s visual language lives alongside the Hugo project so that marketing pages and product documentation stay in sync. Core design tokens are defined in `assets/css/main.css` and surfaced to Tailwind through `tailwind.config.js`, making colour and spacing choices available as semantic utility classes.

- **Colour palette** – Brand blues (`--brand-blue-500/700/800`), trust navy, verify green, accent cyan, and warning amber sit alongside neutral background, surface, and border tokens. These variables drive Tailwind colour aliases (for example `bg-surface`, `text-body-2`), keeping templates expressive without hard-coded hex values.
- **Typography** – The default sans-serif stack uses Inter for body copy and Plus Jakarta Sans for headings. Tailwind’s `font-sans` and `font-heading` utilities map to these families, while prose components rely on the typography plugin for readable long-form content.
- **Spacing and layout** – A shared `.container` class sets max-width and horizontal padding, and `.section` governs vertical rhythm. Custom utilities such as the rounded CTA pill (`.btn`, `.btn-primary`, `.btn-secondary`) give consistent interactivity across pages.

## Components and Patterns

Tailwind component layers declare navigation pills, feature cards, highlight blocks, and CTA sections. Shortcodes in `layouts/shortcodes/` consume these styles to render heroes, feature grids, testimonials, and team listings without repeating markup. When new marketing blocks are required, authors can extend the existing layers or compose utilities, ensuring additions remain visually aligned.

## Future Enhancements

We are gathering requirements for richer token documentation, including sample usage, downloadable assets, and code snippets for product teams. Planned updates include:

- Previewing both light and dark variants of colour tokens.
- Documenting button and form states with accessibility annotations.
- Publishing Figma tokens that mirror the Tailwind configuration.

_What documentation would help your team implement Independent Impact experiences faster?_ Let us know so we can prioritise the next iteration of the design system.
