# Apple HIG Foundations Reference

Pure knowledge base for Apple Human Interface Guidelines foundations, translated to web-native equivalents. All values, ratios, and techniques use CSS, HTML, ARIA, and JavaScript -- no native platform APIs.

---

## 1. Platform Principles

**iOS -- Clarity, Deference, Depth**: Text legible at every size. Icons precise. Adornments subtle. Content fills the screen. Translucency and layering hint at more. Visual depth conveys hierarchy via touch and discoverability.

Web translation: full-bleed layouts, minimal chrome, layering via `z-index` and `backdrop-filter`. Interface elements defer to content.

**iPadOS -- Versatility**: Not a big phone. Supports touch, keyboard, trackpad simultaneously. Use additional space for sidebars and multi-column layouts -- do not stretch phone layouts wider.

Web translation: at 768px+, switch from tab-bar to sidebar navigation. Add hover states and keyboard shortcuts. Support drag and drop for content manipulation.

**macOS -- Power and Spaciousness**: Users expect density, keyboard efficiency, simultaneous access to multiple information streams. Windows are user-resizable, so layouts must handle a wide range of widths.

Web translation: at 1024px+, increase density. Smaller targets acceptable (24px min for pointer-only). Keyboard shortcuts expected. Right-click context menus.

---

## 2. Cross-Platform Comparison

| Dimension | Phone (Compact) | Tablet (Regular) | Desktop |
|-----------|-----------------|-------------------|---------|
| Primary input | Touch | Touch + Pointer + Keyboard | Pointer + Keyboard |
| Touch target | 44px min | 44px touch / 34px pointer | 24px min |
| Navigation | Tab bar (bottom) | Sidebar or tab bar | Sidebar, menu bar, tabs |
| Density | Comfortable, single-column | Medium, multi-column | Dense, multi-pane |
| Margins | 16px | 24px | 24-48px flexible |
| Hover states | None | Yes | Expected |
| Keyboard shortcuts | Limited | Expected for power users | Essential |
| Context menus | Long press | Long press / right-click | Right-click |
| Multitasking | One app at a time | Split view, slide over | Multiple windows |

---

## 3. Accessibility

**POUR Framework**: Perceivable (text alternatives, sufficient contrast, no color-alone). Operable (keyboard, sufficient time, no seizures, clear navigation). Understandable (readable, predictable, input assistance). Robust (semantic HTML, valid ARIA, future-compatible).

### Contrast Ratios (WCAG 2.1)

| Context | Minimum | Enhanced | Notes |
|---------|---------|----------|-------|
| Body text (<24px, <19px bold) | 4.5:1 | 7:1 | Most interface text |
| Large text (>=24px, >=19px bold) | 3:1 | 4.5:1 | Headings, display text |
| UI components (borders, icons) | 3:1 | -- | Buttons, form fields |
| Focus indicators | 3:1 | -- | Against both background and component |
| Decorative / disabled | None | -- | Not required but consider usability |

### Focus Indicators

```css
:focus-visible {
  outline: 2px solid var(--focus-color);
  outline-offset: 2px;
}
:focus:not(:focus-visible) {
  outline: none;
}
@media (forced-colors: active) {
  :focus-visible { outline: 2px solid Highlight; }
}
```

### Keyboard Navigation

- Tab forward, Shift+Tab back. Enter/Space to activate. Escape to close.
- Arrow keys within composite widgets (menus, tabs, grids).
- Skip-to-main link as first focusable element.
- Focus order must match visual reading order.

### Screen Reader Support

- Semantic HTML (`nav`, `main`, `aside`, `dialog`) over generic `div`/`span`
- `aria-label` for icon-only buttons
- `aria-live` regions for dynamic content updates
- `aria-expanded` for collapsible sections
- `role="status"` for status messages
- Announce route changes in SPAs via `aria-live`

### Preference Media Queries

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
@media (prefers-contrast: more) {
  :root { --border-width: 2px; --focus-ring-width: 3px; }
}
@media (prefers-reduced-transparency: reduce) {
  .translucent { backdrop-filter: none; background: var(--bg-solid); }
}
```

---

## 4. Color

### Semantic System

Colors defined by role, not hue. Every token answers "what does this communicate?"

**Label hierarchy** (text, most to least prominent): Primary > Secondary > Tertiary > Quaternary.

**Background hierarchy**: Primary (main canvas) > Secondary (grouped content) > Tertiary (nested within groups).

**Separator hierarchy**: Opaque (full-width between unrelated content) > Non-opaque (inset between related items).

**Fill hierarchy** (shapes, controls, interactive backgrounds): Primary > Secondary > Tertiary > Quaternary.

### Web CSS Custom Properties

```css
:root {
  --label-primary: oklch(15% 0 0);
  --label-secondary: oklch(40% 0 0);
  --label-tertiary: oklch(55% 0 0);
  --label-quaternary: oklch(70% 0 0);
  --bg-primary: oklch(100% 0 0);
  --bg-secondary: oklch(97% 0 0);
  --bg-tertiary: oklch(94% 0 0);
  --color-accent: oklch(55% 0.25 260);
  --color-destructive: oklch(55% 0.22 25);
  --color-success: oklch(55% 0.18 145);
  --color-warning: oklch(65% 0.18 80);
}
```

### Accent Color Rules

Use for: selected states, toggles, links, progress indicators, active nav items.
Do NOT use for: large backgrounds, body text, decorative elements.

### High Contrast Variants

Under `prefers-contrast: more`: increase label contrast one step, add visible borders to all interactive elements, replace subtle fills with clear borders.

### Color Blindness

~8% of men, ~0.5% of women have color vision deficiency. Most common: red-green (deuteranopia/protanopia). Never rely on red vs green alone. Blue vs orange is the safest high-contrast pair. Always pair color with shape, position, or text.

---

## 5. Dark Mode

Not an inverted light mode. A distinct design with its own rules.

**Elevated surfaces get lighter**: Modals/popovers lighter than base canvas (opposite of light mode shadow). **Reduce contrast**: off-white on near-black, not pure white on pure black. **Desaturate colors**: lower chroma to prevent overwhelm.

### Three Background Levels

```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg-primary: oklch(13% 0 0);     /* Base canvas */
    --bg-secondary: oklch(18% 0 0);   /* Cards, grouped */
    --bg-tertiary: oklch(23% 0 0);    /* Modals, popovers */
  }
}
```

### Image Treatment

- `filter: brightness(0.85)` on photographic images
- Alternate dark versions of logos and illustrations
- Transparent PNGs may need a background or adjusted opacity
- Avoid pure-white images on dark backgrounds

### Testing Checklist

All text meets contrast. Elevated surfaces visibly lighter. Colors desaturated enough. No jarring bright spots. Borders and separators visible. Focus indicators visible. No pure black or white. No layout shift on toggle.

---

## 6. Typography

### Hierarchy Table

| Role | Size (rem) | Weight | Leading | Usage |
|------|-----------|--------|---------|-------|
| Large Title | 2.125 (34px) | 700 | 1.18 | Page headers |
| Title 1 | 1.75 (28px) | 700 | 1.21 | Section headers |
| Title 2 | 1.375 (22px) | 700 | 1.27 | Subsection headers |
| Title 3 | 1.25 (20px) | 600 | 1.3 | Card/group headers |
| Headline | 1.0625 (17px) | 600 | 1.35 | Emphasized body, labels |
| Body | 1.0625 (17px) | 400 | 1.47 | Primary content |
| Callout | 1.0 (16px) | 400 | 1.5 | Secondary content |
| Subhead | 0.9375 (15px) | 400 | 1.33 | Supporting labels |
| Footnote | 0.8125 (13px) | 400 | 1.38 | Timestamps, metadata |
| Caption 1 | 0.75 (12px) | 400 | 1.33 | Captions, annotations |
| Caption 2 | 0.6875 (11px) | 400 | 1.36 | Smallest legible text |

### Key Rules

- `font-optical-sizing: auto` for fonts that support it
- `font-variant-numeric: tabular-nums` for data alignment
- Minimum legible size: `max(0.6875rem, 11px)` -- never below this
- Use `rem` for font sizes (not `px`) to respect user settings
- `font-display: swap` with metric-matched fallbacks to prevent layout shift
- Never set `user-scalable=no` in viewport meta
- Test at 200% zoom -- no content overflow or clipping

### Web Font Loading

```css
@font-face {
  font-family: 'CustomFont';
  src: url('font.woff2') format('woff2');
  font-display: swap;
}
/* System fallback stack */
--font-system: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
```

---

## 7. Layout

### 8pt Grid

All spacing from an 8px base. 4px half-steps for fine tuning.

| Token | Value | Usage |
|-------|-------|-------|
| space-1 | 4px | Icon-to-label gap, tight inline |
| space-2 | 8px | Compact padding, default inline |
| space-3 | 12px | Small component padding |
| space-4 | 16px | Standard padding, phone margins |
| space-5 | 20px | Component gaps |
| space-6 | 24px | Tablet margins, section padding |
| space-7 | 32px | Desktop margins, large gaps |
| space-8 | 40px | Section separation |
| space-9 | 48px | Desktop margins, major sections |
| space-10 | 64px | Page-level spacing |

### Margins by Platform

```css
:root { --margin-page: 16px; }
@media (min-width: 768px) { :root { --margin-page: 24px; } }
@media (min-width: 1024px) { :root { --margin-page: clamp(24px, 4vw, 48px); } }
```

### Safe Areas

```css
/* Respect notch, home indicator, status bar */
body {
  padding: env(safe-area-inset-top) env(safe-area-inset-right)
           env(safe-area-inset-bottom) env(safe-area-inset-left);
}
/* Fixed bottom elements */
.bottom-bar {
  padding-bottom: calc(var(--bar-padding) + env(safe-area-inset-bottom));
}
```

### Max-Widths

| Content Type | Max-Width | Reason |
|--------------|-----------|--------|
| Body text | 65ch | Optimal line length (45-75 chars) |
| Forms | 480px | Comfortable single-column input |
| Content area | 768px | Focused reading |
| Wide layout | 1200px | Multi-column with margins |
| Full-bleed | 100% | Edge-to-edge (images, backgrounds) |

### Responsive Breakpoints

| Name | Width | Target |
|------|-------|--------|
| compact | <768px | Phones |
| regular | 768-1023px | Tablets, small laptops |
| wide | >=1024px | Desktop, landscape tablets |
| expansive | >=1440px | Large desktop |

Use `100dvh` (dynamic viewport) on mobile, not `100vh` which includes browser chrome.

---

## 8. Motion

### Spring-to-CSS Translation

| Native Spring | CSS Equivalent | Usage |
|---------------|---------------|-------|
| Responsive (stiffness 300) | `ease-out` / `cubic-bezier(0.2, 0, 0, 1)` | General transitions |
| Interactive (stiffness 400) | `cubic-bezier(0.1, 0, 0, 1)` | Direct manipulation |
| Snappy (stiffness 200) | `cubic-bezier(0.3, 0, 0, 1)` | Sheet/panel reveals |

### Duration by Context

| Context | Duration | Examples |
|---------|----------|---------|
| Micro-interaction | 100ms | Button press, toggle, opacity |
| Standard transition | 200-300ms | Panel slide, accordion, dropdown |
| Layout shift | 400-500ms | Page transition, sidebar collapse |
| Entry/reveal | 300-500ms | Modal entrance, card appear |
| Exit/dismiss | 200-300ms | Always faster than entry |

### Staggered Transitions

```css
.list-item {
  opacity: 0; transform: translateY(8px);
  animation: fadeInUp 300ms ease-out forwards;
}
.list-item:nth-child(1) { animation-delay: 0ms; }
.list-item:nth-child(2) { animation-delay: 50ms; }
.list-item:nth-child(3) { animation-delay: 100ms; }
/* Cap at ~6 items, rest load instantly */
@keyframes fadeInUp { to { opacity: 1; transform: translateY(0); } }
```

### prefers-reduced-motion

Mandatory -- ~18% of adults have vestibular disorders. Set `animation-duration: 0.01ms`, `transition-duration: 0.01ms`, `scroll-behavior: auto` under the media query.

---

## 9. Writing

**Principles**: Clear (one idea per sentence, active voice). Concise ("Save" not "Save your changes"). Human (knowledgeable friend, not corporation). Positive (what users can do, not what they cannot).

### Button Labels

| Instead of | Use |
|-----------|-----|
| Submit | Save, Send, Publish, Create |
| OK | [Specific action: Save, Delete, Continue] |
| Cancel | Keep editing, Go back, Discard |
| Click here | [Destination or action name] |
| Yes/No | [Restate: Delete/Keep, Send/Cancel] |

Title Case for buttons. Sentence case for descriptions and body text.

### Error Messages

State what happened. Explain why briefly. Tell the user what to do next.
Good: "This email is already registered. Sign in instead?"
Bad: "Error 409: Conflict -- duplicate key constraint violation on users.email"

### Empty States

Explain what will appear. Provide a clear action. Match product tone.
Good: "No conversations yet. Start one to begin."
Bad: "Nothing to display."

---

## 10. Inclusion

**Language**: Gender-neutral (they/them). Avoid idioms that do not translate globally. Person-first ("person with a disability"). Avoid "simple" and "easy."

**Representation**: Diverse illustrations (skin tones, body types, ages, abilities). Do not default to Western norms. Avoid stereotypes in example data.

**Accessibility as Inclusion**: Not a feature -- a prerequisite. Every design decision includes or excludes. Accessibility failures are bugs, not enhancement requests.

---

## 11. RTL (Right-to-Left)

**Mirror**: Layout direction, text alignment, navigation order, disclosure arrows, progress indicators, padding/margins.

**Do NOT mirror**: Media playback controls, numbers, clocks, images/photos, checkmarks, close icons.

### CSS Logical Properties

```css
/* Physical (wrong) */
.wrong { margin-left: 16px; padding-right: 8px; text-align: left; }
/* Logical (correct) */
.right { margin-inline-start: 16px; padding-inline-end: 8px; text-align: start; }
/* Logical border-radius and positioning */
.card { border-start-start-radius: 8px; }
.icon { inset-inline-start: 12px; }
```

**Bidi Text**: `html[dir="rtl"]` for document direction. `unicode-bidi: isolate` for embedded LTR in RTL.

---

## 12. Icons

### Web SVG

```html
<svg viewBox="0 0 24 24" width="24" height="24" fill="none"
     stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
     stroke-linejoin="round" aria-hidden="true">
  <path d="..." />
</svg>
<button aria-label="Close dialog"><svg aria-hidden="true">...</svg></button>
```

### Sizing Scale

16px (inline/tight), 20px (default/buttons), 24px (nav/primary), 32px (features), 48px (empty states/onboarding).

### Optical Alignment

Icons need visual nudging to appear centered. A play triangle shifts ~2px right. Use `transform: translateX()` not viewBox changes.

### Stroke vs Fill

Outline (stroke) for default/inactive states. Filled for selected/active. Consistent stroke-width (1.5px or 2px) across the full set.

---

## 13. Images

### Resolution

```html
<img src="image-800.jpg"
     srcset="image-400.jpg 400w, image-800.jpg 800w, image-1200.jpg 1200w"
     sizes="(max-width: 768px) 100vw, 800px"
     alt="Description of the image"
     loading="lazy" decoding="async" />
```

Above-fold: `loading="eager"` + `fetchpriority="high"`. Below-fold: `loading="lazy"` + `decoding="async"`.

### Aspect Ratio

```css
.image-container { aspect-ratio: 16 / 9; overflow: hidden; }
.image-container img { width: 100%; height: 100%; object-fit: cover; }
```

### Dark Mode

`filter: brightness(0.85)` on photos. `filter: invert(1) hue-rotate(180deg)` for diagrams. Provide alternate dark versions of logos. All meaningful images need alt text; decorative images get `alt=""`.

---

## 14. Materials (Translucency)

### Levels

| Level | Blur | Opacity | Usage |
|-------|------|---------|-------|
| Light | 10px | 85% | Subtle depth, nav bars |
| Medium | 20px | 72% | Toolbars, panels |
| Heavy | 40px | 60% | Modal backdrops |

```css
.translucent-bar {
  background: oklch(100% 0 0 / 0.72);
  backdrop-filter: blur(20px) saturate(1.8);
  -webkit-backdrop-filter: blur(20px) saturate(1.8);
}
```

**Performance**: GPU-composited but expensive on lower-end devices. Always provide solid fallback via `@supports not (backdrop-filter: blur(1px))`. Avoid large areas or overlapping layers. Respect `prefers-reduced-transparency`. Test on mobile devices.

---

## 15. Branding

**Content-First**: Branding lives in accent color (one primary, one secondary max), typeface, tone of voice, favicon/logo. NOT in decorative gradients, saturated backgrounds, animated logos, or brand-colored body text.

**Custom Fonts**: 1-2 families max. Load only used weights. `font-display: swap`. Metric-matched fallbacks. Subset to required character sets for performance.

---

## 16. Input Methods

### Touch Targets

44x44px minimum. 8px minimum gap between adjacent targets. 48x48px comfortable. Primary actions in bottom 40% of phone screen (thumb reach zone).

### Gesture Conventions

| Gesture | Expected behavior |
|---------|-------------------|
| Tap | Activate, select |
| Long press | Context menu, preview |
| Swipe left | Destructive (delete, archive) |
| Swipe right | Constructive (mark done) |
| Edge swipe | Browser back (do not override) |
| Pull down | Refresh |
| Pinch | Zoom (do not override) |

### Keyboard Shortcuts

Cmd/Ctrl+K (command palette), +S (save), +Z (undo), +Shift+Z (redo). Escape to close/cancel. `/` to focus search when no input focused. Display hints in tooltips and menus. Detect platform: `navigator.platform.includes('Mac')`.

### Pointer Behavior

`cursor: pointer` (clickable), `text` (selectable), `grab/grabbing` (draggable), `not-allowed` (disabled), `col-resize/row-resize` (resizable borders).

### Focus Management

Tab order matches visual order. Trap focus inside modals. Return focus to trigger on close. `:focus-visible` for keyboard-only rings. Skip link as first focusable element, hidden until focused.

---

## 17. Do's and Don'ts

### Do

- Use semantic HTML (`button`, `nav`, `main`, `dialog`) over styled divs
- Design on the 8pt grid for all spacing
- Provide `:focus-visible` styles at 3:1 contrast on all interactive elements
- Test every feature at 200% browser zoom
- Use CSS logical properties for RTL-ready layouts
- Respect all `prefers-*` media queries
- Make touch targets at least 44px
- Use `rem` for font sizes
- Provide text alternatives for meaningful images and icons
- Test light and dark color schemes with equal rigor
- Stagger list entry animations (cap at 6 items)
- Use `currentColor` in SVG icons
- Include solid fallback for `backdrop-filter`

### Don't

- Port native patterns verbatim (swipe-to-delete, rubber-band scroll, native sheets)
- Use `px` for font sizes
- Rely on hover as the only reveal mechanism (no hover on touch)
- Use `user-scalable=no` or `maximum-scale=1`
- Apply bounce or elastic easing
- Place interactive elements <8px apart on touch surfaces
- Use `outline: none` without providing an alternative focus indicator
- Animate `width`, `height`, `padding`, or `margin` (use `transform` and `opacity`)
- Assume left-to-right (use `start`/`end` not `left`/`right`)
- Use color alone to communicate state
- Skip `prefers-reduced-motion` for any animation
- Stack multiple `backdrop-filter` layers
- Use `100vh` on mobile (use `100dvh` for dynamic viewport)
