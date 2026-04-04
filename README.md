# Design Skills

Claude Code skills for making web apps that feel considered.

Two things make these work: a `design.md` file that holds your design system, and a set of skills that know how to read it, advise you, and evolve it over time. You ask a design question, get a recommendation, approve it, and the decision gets written back. Your 50th question is informed by the first 49.

## Install

Works with Claude Code and Cursor out of the box.

```
npx skills add cozyss/design-skills
```

Or pick specific ones:

```
npx skills add cozyss/design-skills --skill hig --skill critique --skill polish
```

Skills live in `.claude/skills/` and `.cursor/skills/` so both editors find them automatically.

## Getting Started

If you don't have a `design.md` yet, start here:

```
/hig-init
```

It'll ask about your product, scan your codebase, and generate a complete design system — colors, typography, spacing, components, the works. Grounded in Apple's Human Interface Guidelines, adapted for the web.

Once you have a `design.md`, just start asking:

```
/hig should this button be filled or outlined?
```

You get a recommendation. If it means the design system should change, Claude proposes the update. You approve, `design.md` evolves, and everything stays consistent.

## Skills

### Design System (Apple HIG)

The foundation. These skills reference Apple's Human Interface Guidelines and use `design.md` as the evolving source of truth.

| | |
|---|---|
| `/hig-init` | Generate your `design.md` from scratch. Start here. |
| `/hig` | Ask any design question. Routes to the right module, or audits your whole system. |
| `/hig-foundations` | Color, typography, spacing, layout, motion, accessibility, dark mode, input methods. |
| `/hig-patterns` | Navigation, modals, onboarding, loading, feedback, forms, sharing, notifications. |
| `/hig-components` | Buttons, menus, inputs, lists, alerts, popovers, sheets, tabs, charts, and more. |

### Review & Critique

Don't know what's wrong or where to start? `/design-review` reads your UI, tells you what the real problems are, picks the right skills to fix them, and presents the plan for you to review before anything runs.

| | |
|---|---|
| `/design-review` | **Start here.** Reviews your UI, diagnoses problems, presents a plan, then executes on your go-ahead. |
| `/critique` | Deep UX evaluation with scoring, persona testing, and actionable feedback. |
| `/audit` | Technical quality checks — accessibility, performance, theming, responsive, anti-patterns. |
| `/normalize` | Find where your UI has drifted from the design system and bring it back in line. |

### Refinement

Take something that works and make it better.

| | |
|---|---|
| `/polish` | Final quality pass — alignment, spacing, consistency, micro-details. |
| `/clarify` | Fix unclear copy, error messages, labels, and instructions. |
| `/typeset` | Improve font choices, hierarchy, sizing, weight, and readability. |
| `/colorize` | Add strategic color to monochromatic or dull interfaces. |
| `/arrange` | Fix layout, spacing, and visual rhythm. |
| `/distill` | Strip to the essence — remove unnecessary complexity. |
| `/extract` | Pull reusable components and tokens into your design system. |

### Enhancement

Push things further when "good" isn't enough.

| | |
|---|---|
| `/animate` | Add purposeful motion, transitions, and micro-interactions. |
| `/delight` | Add personality, joy, and memorable touches. |
| `/bolder` | Amplify safe designs — more impact, more character. |
| `/overdrive` | Go all-out — shaders, spring physics, scroll-driven effects, 60fps everything. |

### Calibration

Dial the intensity up or down.

| | |
|---|---|
| `/quieter` | Tone down overstimulating designs. Calmer, more refined. |

### Resilience

Make it production-ready.

| | |
|---|---|
| `/harden` | Error handling, i18n, text overflow, edge cases. |
| `/optimize` | Performance — loading, rendering, animations, bundle size. |
| `/adapt` | Responsive design, breakpoints, fluid layouts, touch targets. |
| `/onboard` | First-run experiences, empty states, getting users to value fast. |

### Meta

| | |
|---|---|
| `/teach-impeccable` | One-time setup to gather design context and save it to your AI config. |

## Credits

The review and refinement skills are from [pbakaus/impeccable](https://github.com/pbakaus/impeccable). The HIG design system skills are original to this repo.
