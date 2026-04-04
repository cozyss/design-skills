---
name: hig-components
description: Apply Apple HIG component principles to web design. Covers buttons, menus, inputs, lists, tables, alerts, popovers, sheets, toggles, progress indicators, charts, data visualization, tabs, sidebars, toolbars, pickers, sliders, segmented controls, disclosure controls, scroll views, search fields, and more. Use when designing or reviewing individual UI components.
---

Apply Apple HIG component principles to web design, then surface any conflicts or gaps with `design.md` so the design system can evolve.

## PREPARATION

If design context (audience, use cases, brand tone) is not already in the conversation, invoke /frontend-design to gather it. If context is already loaded or the question is narrow enough to answer without it, skip straight to the work.

Read `design.md` but do NOT let it constrain the HIG recommendation. Gather: what component the user is building, its context, and what states it needs.

-> *Consult [Apple HIG Components Reference](reference/apple-hig-components.md)*

## Internal Process

Do all of this work internally. Do NOT output it phase by phase.

1. **Identify component(s)** -- classify against Apple's catalog, noting category, required states, and desktop/mobile needs.
2. **Recommend independently from Apple HIG** -- apply component principles purely from Apple's wisdom.
3. **Compare against design.md** -- map to existing components, flag conflicts and gaps (components Apple covers that design.md doesn't).
4. **Formulate the output** -- distill into the output format below.

### Component Catalog (apply what is relevant)

**Content**: Charts (type selection, marks/axes/descriptions/interaction/color, progressive disclosure, data accessibility), Image views (resolution, aspect ratio, alt text), Text views (readability, scrolling, dynamic sizing)

**Layout & Organization**: Lists/tables (row for text, grid for visual, selection feedback, sorting), Collections (grid/list, reorder feedback), Split views (primary/secondary, responsive collapse), Tab views (3-5 max, always visible, nav only), Disclosure controls (progressive reveal, descriptive labels), Labels (clear, unambiguous, title caps), Toolbars (primary actions, overflow menu), Sidebars (leading side, outlined icons, collapsible)

**Menus & Actions**: Buttons (plain/bordered/filled hierarchy, 44px touch target, five states), Context menus (relevant items only, mirror in main UI), Edit menus (cut/copy/paste conventions), Menus (standard order, ellipsis for dialogs, disable > hide), Pop-up buttons (mutually exclusive, show current), Pull-down buttons (actions not state, no submenus)

**Navigation & Search**: Navigation bars (title + back + one action), Tab bars (3-5, bottom on mobile, concrete nouns), Search fields (descriptive placeholder, clear button, tokens), Path controls (breadcrumbs, single canonical path), Token fields (removable tags, 44px targets)

**Presentation**: Alerts (sparingly, specific titles, verb buttons not Yes/No), Popovers (one at a time, arrow to trigger, save on dismiss), Sheets (scoped task, swipe dismiss, confirm data loss, no stacking), Action sheets (destructive confirmation, cancel always last), Scroll views (no nested same-axis, natural gestures), Page controls (dots, max ~20), Tooltips (one line, ~0.5s delay)

**Selection & Input**: Text fields (placeholder + visible label, clear button, input type, inline validation), Pickers (medium-long lists, logical order, in-context), Segmented controls (2-5, equal width, mutually exclusive), Sliders (continuous/discrete, track fill, end icons), Steppers (pair with value, disable at bounds), Toggles (on/off only, in list rows, no labels), Date pickers (compact/inline, quarter-hour), Combo boxes (type + dropdown filter)

**Status**: Progress indicators (bars for quantifiable, spinners for unknown, keep animated), Gauges (value in range, alt text), Level indicators (discrete segments), Rating indicators (stars, half-star precision)

## Output Format

Present ONLY this to the user:

### Recommendations

A concise list of specific recommendations for the user's component. Each item:
- **What to do** (one sentence)
- **Why** (one sentence citing the Apple HIG principle)

Keep it tight. 3-8 recommendations, ordered by impact.

### design.md Evolution

Only include this section if there are meaningful conflicts or gaps. Skip it if everything aligns.

For each proposed change:
- **What**: The specific addition or modification (exact text)
- **Where**: Section in design.md
- **Why**: One sentence on what it improves

Flag gaps separately: components Apple covers that design.md doesn't have yet. Ask the user if they want to apply the changes or add the missing components.

## DO
- Start from Apple HIG, independent of design.md
- Specify all states: default, hover, active, disabled, focus (+ error/loading where relevant)
- Enforce 44px touch targets for mobile
- Use semantic HTML and ARIA roles
- Test against both desktop (pointer) and mobile (touch)

## DON'T
- Output the full analysis -- just the distilled recommendations
- Let design.md constrain the recommendation
- Use div where semantic elements exist (button, dialog, nav, details)
- Hide critical functionality behind context menus only
- Skip keyboard navigation -- every component needs a focus path
