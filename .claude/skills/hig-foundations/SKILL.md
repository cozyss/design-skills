---
name: hig-foundations
description: Apply Apple HIG foundation principles and platform-specific guidance to web design. Covers color, typography, layout, motion, accessibility, dark mode, writing, inclusion, icons, images, materials, branding, RTL, and cross-platform input (touch, keyboard, pointer). Use for design system tokens, visual foundations, responsive/adaptive design, or platform-specific considerations.
---

Apply Apple HIG foundation principles to web design, then surface any conflicts with `design.md` so the design system can evolve.

## PREPARATION

If design context (audience, use cases, brand tone) is not already in the conversation, invoke /frontend-design to gather it. If context is already loaded or the question is narrow enough to answer without it, skip straight to the work.

Read `design.md` for comparison but do NOT let it constrain the HIG recommendation. Gather: which foundation area the user is working on and what problem they are solving.

-> *Consult [Apple HIG Foundations Reference](reference/apple-hig-foundations.md)*

## Internal Process

Do all of this work internally. Do NOT output it phase by phase.

1. **Recommend independently from Apple HIG** -- apply the relevant principles below for the user's specific problem, purely from Apple's wisdom adapted for web.
2. **Compare against design.md** -- read `design.md` fresh and identify where the recommendation aligns, conflicts, or fills a gap.
3. **Formulate the output** -- distill into the output format below.

### Foundation Areas (apply what is relevant)

**Platform Foundations** (responsive web handles all three):
- iOS: Touch-first, 44px targets, one-handed reach, safe areas, gesture conventions, tab bar nav
- iPadOS: Don't scale up mobile, sidebar > tab bar, pointer support, keyboard shortcuts, size classes, drag and drop
- macOS: Keyboard-first, dense display, menu bar conventions, window management

**Visual Foundations**:
- Accessibility: POUR, contrast (4.5:1 text, 3:1 large, 7:1 ideal), focus indicators (3:1, 2px), keyboard nav, screen readers, prefers-reduced-motion/prefers-contrast
- Color: Semantic system, light/dark, high contrast variants, color blindness, never color alone
- Dark mode: Not-inverted, elevated surfaces, three background levels, test both modes
- Typography: Hierarchy (title->body->caption), weight/size/leading, tabular-nums, min 11pt/14px
- Layout: 8pt grid, margins (16px phone, 24px tablet), content density, max-widths, responsive breakpoints
- Motion: Spring -> CSS ease-out, durations (100ms micro, 200-300ms standard, 400-500ms layout), prefers-reduced-motion, no bounce
- Writing: Clear, concise, human, action verbs, title case buttons, sentence case descriptions
- Inclusion: Gender-neutral, cultural sensitivity, diverse representation, accessibility-as-inclusion
- RTL: Mirror layout, keep media/numbers LTR, CSS logical properties, bidi text
- Icons: Consistent stroke/fill, web SVGs (viewBox, currentColor), optical alignment, sizing scale
- Images: srcset for resolution, aspect-ratio, lazy load, alt text, dark mode treatment
- Materials: backdrop-filter sparingly, performance cost, reserve for depth hierarchy
- Branding: Content-first, accent colors, custom fonts with restraint

**Input Methods**:
- Touch: 44px targets, touch-friendly spacing, gesture conventions
- Keyboard: Shortcuts, tab order, focus management
- Pointer: Hover states, precision targets (24px min), right-click, cursor feedback
- Focus: Visible rings, logical tab flow, :focus-visible, skip links

## Output Format

Present ONLY this to the user:

### Recommendations

A concise list of specific recommendations for the user's problem. Each item:
- **What to do** (one sentence)
- **Why** (one sentence citing the Apple HIG principle)

Keep it tight. 3-8 recommendations, not an encyclopedia.

### design.md Evolution

Only include this section if there are meaningful conflicts or gaps. Skip it if everything aligns.

For each proposed change:
- **What**: The specific design.md addition or modification (exact text)
- **Where**: Section in design.md
- **Why**: One sentence on what it improves

Ask the user if they want to apply the changes.

## DO
- Start from Apple HIG, adapt to web
- Use 8pt grid, 44px touch targets, WCAG contrast
- Provide prefers-reduced-motion alternatives
- Use CSS logical properties for RTL readiness

## DON'T
- Output the full analysis -- just the distilled recommendations
- Copy native conventions verbatim -- translate to web
- Recommend color changes without checking light and dark mode
- Propose design.md changes without explaining what improves
