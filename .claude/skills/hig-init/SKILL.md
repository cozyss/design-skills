---
name: hig-init
description: Bootstrap a design.md file grounded in Apple Human Interface Guidelines. Gathers project context (brand, audience, platforms, tech stack) then generates a complete design system document with HIG-aligned tokens, typography, color, spacing, components, and patterns. Use when a project has no design.md or needs to start fresh.
---

Generate a `design.md` grounded in Apple HIG principles, tailored to the project.

## Process

### 1. Gather Context

Ask the user these questions (skip any they've already answered in the conversation). Use AskUserQuestion to collect them efficiently:

**Product & Audience**
- What does the product do? (one sentence)
- Who is the primary audience? (e.g., developers, consumers, enterprise)
- What is the brand tone? (e.g., professional, playful, minimal, warm)

**Platform Targets**
- Which platforms? (phone, tablet, desktop, or all three)
- Primary input method? (touch-first, pointer-first, or both)

**Tech Stack** (helps tailor the output)
- CSS approach? (vanilla CSS, Tailwind, CSS modules, styled-components, etc.)
- Component framework? (React, Vue, Svelte, vanilla, etc.)

If the user says "just pick good defaults" or similar, use these:
- All three platforms, touch and pointer
- Professional but approachable tone
- Vanilla CSS custom properties (most portable)

### 2. Scan the Codebase

Before generating, look for existing signals:
- Existing CSS files: extract any color values, font stacks, spacing patterns already in use
- Package.json or similar: note the framework and relevant UI libraries
- Any existing design tokens, theme files, or style guides

Use what you find to align the generated design.md with reality -- don't create a system that contradicts what's already built. Note any conflicts to the user.

### 3. Generate design.md

Write the file to `design.md` in the project root (or wherever the user specifies). The document must include all sections below. Use the Apple HIG reference values from the sibling skills as the source of truth.

---

## design.md Structure

Generate all of the following sections. Tailor content to the user's answers but keep HIG alignment non-negotiable.

### Preamble

Brief paragraph: what the product is, who it's for, the design philosophy. Reference Apple HIG as the foundation.

### Color

- Semantic token system (label hierarchy, background hierarchy, fills, separators)
- Accent color (derived from brand) with accessible contrast ratios
- Destructive, success, warning semantic colors
- Full light and dark mode token sets using `oklch`
- High-contrast variant notes
- Rule: never use color alone to convey meaning

### Typography

- Type scale using the HIG hierarchy (Large Title through Caption 2)
- Font stack (system default unless the user specifies a brand font)
- `rem`-based sizes, `font-display: swap`, `font-variant-numeric: tabular-nums` for data
- Line-height and weight mappings
- Rule: minimum 11px/0.6875rem, test at 200% zoom

### Spacing & Layout

- 8pt grid with token scale (space-1 through space-10)
- Page margins by platform (16px phone, 24px tablet, clamp for desktop)
- Responsive breakpoints (compact, regular, wide, expansive)
- Max-width tokens (text, forms, content, wide, full-bleed)
- Safe area handling
- Rule: use CSS logical properties for RTL readiness

### Motion

- Duration scale (micro, standard, layout, entry, exit)
- Easing curves (responsive, interactive, snappy)
- `prefers-reduced-motion` policy: mandatory, zero-duration fallback
- Rule: exit faster than entry, cap stagger at 6 items

### Accessibility

- WCAG 2.1 AA as minimum (note AAA targets)
- Contrast requirements (4.5:1 text, 3:1 large/UI, 3:1 focus)
- Focus indicator spec (2px outline, 2px offset, `:focus-visible`)
- Keyboard navigation requirements
- Screen reader support patterns
- Media query respect: `prefers-reduced-motion`, `prefers-contrast`, `prefers-color-scheme`, `prefers-reduced-transparency`

### Icons

- SVG with `currentColor`, `viewBox`, consistent stroke-width
- Size scale (16, 20, 24, 32, 48)
- Stroke for default, fill for active/selected
- `aria-hidden="true"` on decorative, `aria-label` on functional

### Components

A concise catalog of the components the product needs (informed by the user's description). For each:
- Name and purpose
- Visual hierarchy (e.g., button: plain < bordered < filled)
- States: default, hover, active, disabled, focus (+ error/loading where relevant)
- Key specs: sizing, touch targets, ARIA roles

Start with the essentials (buttons, inputs, alerts, navigation) and note which others to add as the product grows. Don't exhaustively list every HIG component -- only what the product needs now plus obvious near-term additions.

### Patterns

Key interaction patterns the product uses (informed by the user's description). For each:
- Name and when it applies
- Core principles (from HIG)
- Key implementation notes

Start with the essentials (navigation, feedback, loading, forms) and expand as needed.

### Platform Behavior

How the design adapts across the user's target platforms:
- Navigation model per breakpoint
- Touch target sizes per context
- Density and margin adjustments
- Input method considerations (hover, keyboard shortcuts, gestures)

---

## After Generating

1. Present a summary of what was generated and any choices made.
2. Note any conflicts with existing code found during the scan.
3. Suggest running `/hig audit my design system` as the next step to refine.

## DO
- Use exact token values from Apple HIG (8pt grid, 44px targets, oklch colors, rem typography)
- Make the document self-contained and readable without the HIG reference
- Include CSS custom property examples inline (not a separate file)
- Tailor component and pattern sections to the actual product
- Keep it concise -- this is a reference document, not a textbook

## DON'T
- Generate a generic design system with no product context
- Include components or patterns the product clearly won't need
- Use pixel values for font sizes
- Skip dark mode
- Produce the document without scanning the codebase first
- Add a "generated by" watermark or boilerplate
