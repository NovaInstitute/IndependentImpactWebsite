# Independent Impact — Color & Theming Specification (Hugo + Saasify)
**Version:** 1.0 • **Date:** September 22, 2025 • **Owner:** Independent Impact (Christiaan)

> Objective: Provide a pragmatic, WCAG-compliant color system that communicates *openness* and *truthfulness* for an open system of verified impact. This spec is designed for a straightforward implementation in Hugo using the Saasify theme, with minimal risk and clear acceptance tests.

---

## 1) Scope & Non-Goals
**Scope**
- Color tokens, roles, and usage rules for light & dark modes.
- Implementation guidance for Hugo + Saasify via SCSS/CSS variables.
- Component-level mappings (links, buttons, badges, alerts, charts).
- Accessibility baselines and acceptance criteria.

**Non-Goals**
- Typography, spacing, iconography, or layout decisions.
- Brand mark/logotype design.
- Custom Hugo template refactors beyond theme token overrides.

---

## 2) Design Principles
1. **Openness (primary signal):** Sky-leaning blues for clarity and approachability.
2. **Truthfulness (secondary signal):** Grounded navy for institutional weight and credibility.
3. **Verification (functional):** Green reserved for “verified” and success outcomes.
4. **Restraint:** Accent cyan is a highlight only; avoid using it for long-form text.
5. **Accessibility first:** All default text and interactive states must meet WCAG 2.2 AA minimums.

---

## 3) Color Tokens (Source of Truth)

> Use these as the canonical tokens. Downstream theme variables should alias to these.

### 3.1 Brand & Functional
| Token | Hex | Role |
|---|---:|---|
| `brand.blue.500` | `#1E88E5` | Primary (hover, accents, hero gradients). Avoid for small body text on white. |
| `brand.blue.700` | `#1976D2` | Primary button fills with white text; robust contrast. |
| `brand.blue.800` | `#1565C0` | Links, headings, small text on white (meets AA). |
| `brand.navy` | `#0A2240` | App chrome, header/footer backgrounds, high-credibility surfaces. |
| `verify.green.700` | `#15803D` | Success states, “verified impact” badges. |
| `accent.cyan` | `#06B6D4` | Secondary accent, dividers, highlights; **not** for body text. |
| `warn.amber.700` | `#B45309` | Strong warning banners (white text). |
| `warn.amber.500` | `#F59E0B` | Subtle warning tags (black/dark text). |
| `error.red.600` | `#DC2626` | Errors, destructive actions. |

### 3.2 Neutrals (Light Mode)
| Token | Hex | Role |
|---|---:|---|
| `neutral.bg` | `#FFFFFF` | Page background. |
| `neutral.surface` | `#F8FAFC` | Cards, panels. |
| `neutral.border` | `#E2E8F0` | Dividers, input borders. |
| `neutral.text` | `#0F172A` | Primary body text. |
| `neutral.text.2` | `#334155` | Secondary text, metadata. |

### 3.3 Neutrals (Dark Mode)
| Token | Hex | Role |
|---|---:|---|
| `dark.bg` | `#0B1220` | Page background (dark). |
| `dark.surface` | `#111827` | Cards, panels (dark). |
| `dark.border` | `#1F2937` | Dividers, input borders (dark). |
| `dark.text` | `#F1F5F9` | Primary text (dark). |
| `dark.text.2` | `#CBD5E1` | Secondary text (dark). |

### 3.4 JSON Design Tokens (for portability)
```json
{
  "brand": {
    "blue": {
      "500": "#1E88E5",
      "700": "#1976D2",
      "800": "#1565C0"
    },
    "navy": "#0A2240"
  },
  "verify": {
    "green": {
      "700": "#15803D"
    }
  },
  "accent": {
    "cyan": "#06B6D4"
  },
  "warn": {
    "amber": {
      "500": "#F59E0B",
      "700": "#B45309"
    }
  },
  "error": {
    "red": {
      "600": "#DC2626"
    }
  },
  "neutral": {
    "bg": "#FFFFFF",
    "surface": "#F8FAFC",
    "border": "#E2E8F0",
    "text": "#0F172A",
    "text2": "#334155"
  },
  "dark": {
    "bg": "#0B1220",
    "surface": "#111827",
    "border": "#1F2937",
    "text": "#F1F5F9",
    "text2": "#CBD5E1"
  }
}
```

---

## 4) Implementation (Hugo + Saasify)

> **Goal:** Override theme styles via SCSS/CSS variables without forking the theme.

### 4.1 CSS Variables (Global)
Create `assets/scss/_ii-colors.scss` and include it from your main SCSS entry (e.g., `assets/scss/main.scss`).

```css
:root {
  --brand-blue-500: #1E88E5;
  --brand-blue-700: #1976D2;
  --brand-blue-800: #1565C0;
  --trust-navy: #0A2240;
  --verify-green-700: #15803D;
  --accent-cyan: #06B6D4;
  --amber-500: #F59E0B;
  --amber-700: #B45309;
  --error-600: #DC2626;

  --bg: #FFFFFF;
  --surface: #F8FAFC;
  --border: #E2E8F0;
  --text: #0F172A;
  --text-2: #334155;
}

.dark {
  --bg: #0B1220;
  --surface: #111827;
  --border: #1F2937;
  --text: #F1F5F9;
  --text-2: #CBD5E1;
}
```

### 4.2 Saasify Variable Aliases (SCSS)
If Saasify exposes variables, alias them to our tokens in `assets/scss/_theme-overrides.scss`. If variable names differ, map to the nearest role and document deviations.

```scss
$primary: var(--brand-blue-700);
$primary-contrast: #fff;
$secondary: var(--trust-navy);

$success: var(--verify-green-700);
$warning: var(--amber-700);
$error: var(--error-600);

$link-color: var(--brand-blue-800);
$link-hover-color: var(--brand-blue-500);

$body-bg: var(--bg);
$body-color: var(--text);
$border-color: var(--border);
```

> **Build:** Ensure your Hugo pipeline includes `resources.ToCSS` for SCSS assets and that your overrides load **after** the theme's default styles.

---

## 5) Component Rules

### 5.1 Links
- Default: `color: var(--brand-blue-800)`; `text-decoration: underline` on hover.
- Hover: `color: var(--brand-blue-500)`.
- Do **not** use `--accent-cyan` for paragraph-length links.

```css
a { color: var(--brand-blue-800); }
a:hover { color: var(--brand-blue-500); text-decoration: underline; }
```

### 5.2 Buttons
**Primary (light):**
- Fill: `--brand-blue-700`
- Text: `#fff`
- Hover: `--brand-blue-800`

**Secondary:**
- Border: `--brand-blue-500`
- Text: `--brand-blue-800`
- Hover bg: 2–4% blue tint (e.g., `rgba(30, 136, 229, 0.08)`)

**Destructive:**
- Fill: `--error-600`, text `#fff`
- Hover: darken 6–8%

### 5.3 Badges (Verification/Success)
- Subtle: bg `#E6F6EC`, text `--verify-green-700`, border `#B7E2C5`.
- Solid: fill `--verify-green-700`, text `#fff`.

### 5.4 Alerts
- **Info:** use blue family; ensure body text is `--text` on light bg.
- **Warning:** solid banner `--amber-700` with `#fff`, or subtle tag `--amber-500` on `#FFF3D6` with dark text.
- **Error:** text/icons `--error-600`; subtle bg `#FEE2E2`.

### 5.5 Surfaces & Layout
- Page bg: `--bg`
- Card bg: `--surface`
- Borders/dividers: `--border`
- Primary text: `--text`, secondary: `--text-2`

### 5.6 Charts (Colorblind-Friendly, Brand-Tied)
Use the following series order:
1. `#1565C0` (Blue 800)
2. `#2BB673` (Green alt for data-only contexts)
3. `#F59E0B` (Amber 500)
4. `#DC2626` (Red 600)
5. `#0A2240` (Navy)
6. `#06B6D4` (Cyan)

> Do not rely solely on color — include patterns/markers and direct value labels where feasible.

### 5.7 Gradients (Optional)
Hero gradient (subtle):  
`linear-gradient(135deg, #1E88E5 0%, #06B6D4 50%, #A6FFCB 100%)`  
- Use sparingly; ensure text is `#fff` or `#0A2240` and passes contrast.

---

## 6) Accessibility & Contrast (WCAG 2.2 AA)

**Pre-validated pairs** (contrast ratios approximate):
- `#FFFFFF` on `#0A2240`: **15.96:1**
- `#1565C0` on `#FFFFFF`: **5.75:1**
- `#FFFFFF` on `#1976D2`: **4.6:1**
- `#15803D` on `#FFFFFF`: **5.02:1**
- `#FFFFFF` on `#B45309`: **5.02:1**
- `#111111` on `#F59E0B`: **9.78:1**
- `#DC2626` on `#FFFFFF`: **4.83:1**

**Rules:**
- Minimum for normal text: **4.5:1** (AA).
- Minimum for large text (≥ 18.66px regular or 14px bold): **3:1**.
- Interactive elements must meet **focus visible** requirements; use clear focus outlines (2px+) that pass **3:1** against both adjacent colors.

**Focus Outline Recommendation:**
- Light mode: `outline: 2px solid #0A2240; outline-offset: 2px;`
- Dark mode: `outline: 2px solid #F1F5F9; outline-offset: 2px;`

---

## 7) Dark Mode

Activate via `.dark` class on `<html>` or `<body>` (or `prefers-color-scheme` media query).

- Backgrounds, surfaces, borders, and text source from the `.dark` variables (Section 4.1).
- Keep brand hues the same; adjust only surfaces and text.
- Ensure link hover remains distinguishable (slightly lighter blue or underline).

```css
@media (prefers-color-scheme: dark) {
  :root { color-scheme: dark; }
}
```

---

## 8) Implementation Checklist (Acceptance Criteria)

**A. Tokenization & Build**
- [ ] `assets/scss/_ii-colors.scss` created and imported after theme styles.
- [ ] Theme variable aliases (`_theme-overrides.scss`) compiled via `resources.ToCSS`.
- [ ] No direct hex values in components (except charts/patterns) — use variables.

**B. Components**
- [ ] Links use `brand.blue.800` default, `brand.blue.500` hover.
- [ ] Primary button: `brand.blue.700` fill, white text, `brand.blue.800` hover.
- [ ] Success/verification badges follow Section 5.3 rules.
- [ ] Alerts follow Section 5.4; warning text is always legible.

**C. Accessibility**
- [ ] Lighthouse Accessibility ≥ **95** on key templates (home, article, form).
- [ ] axe-core scan reports **0** contrast violations.
- [ ] Focus states visible and meet **3:1** minimum.
- [ ] Dark mode retains AA for all body text and buttons.

**D. Documentation**
- [ ] Any deviations from Saasify variable names are mapped and recorded.
- [ ] README snippet added to project to point future contributors to this spec.

---

## 9) Risk Notes & Mitigations (Transparent)
- **Theme drift:** If Saasify updates variables, overrides could regress. *Mitigation:* Pin theme version, add visual regression tests for tokens.
- **Custom component hex creep:** Engineers might hardcode hex values. *Mitigation:* ESLint/stylelint rule to ban hex in CSS; allow only var() usage.
- **Chart readability:** Color-only encoding reduces accessibility. *Mitigation:* Always add labels/markers, test print/fax scenarios (grayscale).

---

## 10) Example HTML Snippet (Sanity Test)
```html
<button class="btn-primary">Primary</button>
<style>
.btn-primary {
  background: var(--brand-blue-700);
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 10px 16px;
}
.btn-primary:hover { background: var(--brand-blue-800); }
</style>
```

---

## 11) Maintenance
- Store this spec in `/docs/design/color-spec.md` and link it from the project README.
- Revalidate contrast whenever a token changes (use an automated CI job).
- Version and date bump on any material change.

---

**End of Spec**