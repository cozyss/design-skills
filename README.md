# Design Skills

Claude Code skills that bring Apple's Human Interface Guidelines to your web projects.

Ask Claude about any design decision and get recommendations grounded in Apple HIG — then let it evolve your `design.md` to match.

## Skills

| Skill | What it does |
|---|---|
| `/hig` | Main entry point. Routes your question to the right module, or audits your whole design system. |
| `/hig-foundations` | Color, typography, layout, motion, accessibility, dark mode, responsive, input methods. |
| `/hig-patterns` | Navigation, modality, onboarding, loading, feedback, forms, sharing, notifications. |
| `/hig-components` | Buttons, menus, inputs, lists, alerts, popovers, sheets, tabs, charts, and more. |

## Setup

Copy the skill folders into your project's skills directory:

```
your-project/
  hig/
  hig-foundations/
  hig-patterns/
  hig-components/
```

These skills assume your project has a `design.md` file they can reference and evolve. If you don't have one, you can tweak the skills to skip that part — or just use them as-is and see what happens.

## Examples

```
/hig should this button be filled or outlined?
/hig audit my design system
/hig-foundations review my color tokens for dark mode
/hig-patterns how should onboarding work?
/hig-components review my alert component
```
