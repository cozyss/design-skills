---
name: hig
description: Apply Apple Human Interface Guidelines to web design across desktop and mobile. Routes to specialized modules for foundations, patterns, or components. Use when the user wants to design, review, or improve UI with Apple design principles, or iteratively evolve the design system.
---

Apply Apple HIG principles to web design decisions. Routes to specialized modules, produces concise recommendations, and proposes `design.md` evolution where Apple's wisdom improves the system.

**Apple HIG leads. The design system follows.**

## Modes

### Targeted (default)
The user asks about a specific thing ("should this button be filled?", "review my loading pattern"). Route to the matching module.

### Audit
The user asks to audit `design.md` or a page against Apple HIG ("audit my design system", "review design.md against HIG", "what's missing?"). Run a comprehensive gap analysis:

1. Read `design.md` in full.
2. Invoke each module in order: `/hig-foundations`, `/hig-patterns`, `/hig-components`.
3. Each module scans its full domain against `design.md`, reporting only **conflicts and gaps** -- skip anything that already aligns.
4. Consolidate all findings into a single prioritized report:

**Output format for audit:**

### Audit: [scope]

**Conflicts** (design.md contradicts Apple HIG):
- [item]: [what design.md says] vs [what Apple recommends]. Impact: [one sentence].

**Gaps** (Apple HIG covers this, design.md doesn't):
- [item]: [what's missing]. Priority: High/Medium/Low.

**Aligned** (summary only): [one sentence noting how many areas checked out fine].

### design.md Evolution
[Consolidated changeset, same format as targeted mode.]

## Routing

Analyze the request and invoke the matching module. For broad requests, invoke in order: foundations, then patterns, then components.

### `/hig-foundations`
Visual foundations (color, typography, spacing, layout, motion, accessibility, dark mode, icons, images, inclusion, RTL, writing, branding, materials), platform adaptation (responsive, mobile vs desktop, touch vs pointer), input methods (gestures, keyboard, pointer, focus), design system tokens.

### `/hig-patterns`
User flows (navigation, modality, onboarding, launching, search), data interaction (forms, feedback, loading, undo, drag and drop), accounts and privacy (auth, notifications, settings, permissions), content management (files, collaboration, sharing, fullscreen), media.

### `/hig-components`
Actions (buttons, menus, toggles, toolbars), layout (lists, tables, tabs, sidebars, disclosure), input (text fields, pickers, sliders, segmented controls), presentation (alerts, popovers, sheets, scroll views), status (progress, gauges), data visualization (charts, graphs).

## After Module Completion

Consolidate any proposed `design.md` changes into a single changeset. The user approves before any file is modified.
