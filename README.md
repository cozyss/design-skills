# Design Skills

Claude Code and Cursor skills for making web apps that feel considered.

There are two commands you need to know:

- **`/hig`** — for designing new things
- **`/design-review`** — for improving existing things

Everything else is wired up behind them. You don't need to memorize 20+ skills — just use the right entry point and it handles the rest.

Both work with `design.md`, a living document that holds your design system and evolves as you make decisions. Your 50th question is informed by the first 49.

## Install

Works with Claude Code and Cursor out of the box.

```
npx skills add cozyss/design-skills
```

Or pick specific ones:

```
npx skills add cozyss/design-skills --skill hig --skill design-review
```

Skills live in `.claude/skills/` and `.cursor/skills/` so both editors find them automatically.

## Getting Started

### 1. Create your design system

```
/hig-init
```

This generates a `design.md` with HIG-aligned tokens and specs — colors, typography, spacing, components, everything. It asks about your product first so the system fits what you're building.

### 2. Design new things with `/hig`

```
/hig should this button be filled or outlined?
/hig how should navigation work on mobile?
/hig what component should I use for this settings page?
```

`/hig` gives you recommendations grounded in Apple's Human Interface Guidelines, then proposes updates to `design.md` so the decision sticks. It routes to the right specialist behind the scenes — foundations, patterns, or components — you don't need to think about which one.

### 3. Improve existing things with `/design-review`

```
/design-review this page feels off
/design-review make this production-ready
/design-review the spacing is all over the place
```

`/design-review` reads your UI, figures out what's actually wrong, picks the right combination of skills to fix it, and presents its findings. You review the plan, then it executes. It might run one skill or five — whatever the situation needs.

## What's Under the Hood

You don't need to call these directly — `/hig` and `/design-review` route to them — but here's what's available if you ever want to go straight to a specific one.

### Design System (behind `/hig`)

| | |
|---|---|
| `/hig-foundations` | Color, typography, spacing, layout, motion, accessibility, dark mode, input methods. |
| `/hig-patterns` | Navigation, modals, onboarding, loading, feedback, forms, sharing, notifications. |
| `/hig-components` | Buttons, menus, inputs, lists, alerts, popovers, sheets, tabs, charts, and more. |

### Review & Refinement (behind `/design-review`)

| | |
|---|---|
| `/critique` | Deep UX evaluation with scoring, persona testing, and actionable feedback. |
| `/audit` | Technical quality checks — accessibility, performance, theming, responsive, anti-patterns. |
| `/normalize` | Bring drifted UI back in line with the design system. |
| `/polish` | Final quality pass — alignment, spacing, consistency, micro-details. |
| `/clarify` | Fix unclear copy, error messages, labels, and instructions. |
| `/typeset` | Improve font choices, hierarchy, sizing, weight, and readability. |
| `/colorize` | Add strategic color to monochromatic or dull interfaces. |
| `/arrange` | Fix layout, spacing, and visual rhythm. |
| `/distill` | Strip to the essence — remove unnecessary complexity. |
| `/extract` | Pull reusable components and tokens into your design system. |
| `/animate` | Add purposeful motion, transitions, and micro-interactions. |
| `/delight` | Add personality, joy, and memorable touches. |
| `/bolder` | Amplify safe designs — more impact, more character. |
| `/overdrive` | Go all-out — shaders, spring physics, scroll-driven effects, 60fps everything. |
| `/quieter` | Tone down overstimulating designs. Calmer, more refined. |
| `/harden` | Error handling, i18n, text overflow, edge cases. |
| `/optimize` | Performance — loading, rendering, animations, bundle size. |
| `/adapt` | Responsive design, breakpoints, fluid layouts, touch targets. |
| `/onboard` | First-run experiences, empty states, getting users to value fast. |

## Keeping Skills Up to Date

The review and refinement skills are synced from [pbakaus/impeccable](https://github.com/pbakaus/impeccable). A GitHub Action checks for upstream changes every Monday and opens a PR if anything's new. You can also sync manually:

```
bash scripts/sync-upstream.sh
```

The sync only touches skills that came from impeccable — it never overwrites the HIG skills or `design-review`.

## Credits

The review and refinement skills are from [pbakaus/impeccable](https://github.com/pbakaus/impeccable) by Paul Bakaus (Apache 2.0). The `frontend-design` skill in impeccable builds on [Anthropic's original](https://github.com/anthropics/skills/tree/main/skills/frontend-design). The HIG design system skills and `/design-review` are original to this repo. See [NOTICE](NOTICE) for full attribution.

## License

Apache 2.0. See [LICENSE](LICENSE).
