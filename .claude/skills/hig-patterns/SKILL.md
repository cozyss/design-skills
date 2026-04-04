---
name: hig-patterns
description: Apply Apple HIG interaction patterns to web design. Covers navigation, modality, data entry, feedback, loading, onboarding, search, accounts, notifications, collaboration, sharing, drag and drop, undo, settings, help, fullscreen, file management, launch, media, ratings, and privacy. Use when designing user flows, interactions, or behavioral patterns.
---

Apply Apple HIG interaction patterns to web design, then surface any conflicts with `design.md` or `product-spec/` so the design system can evolve.

## PREPARATION

If design context (audience, use cases, brand tone) is not already in the conversation, invoke /frontend-design to gather it. If context is already loaded or the question is narrow enough to answer without it, skip straight to the work.

Read `design.md` AND the relevant `product-spec/` file, but do NOT let them constrain the HIG recommendation. Gather: what flow or pattern the user is building and their specific goals.

-> *Consult [Apple HIG Patterns Reference](reference/apple-hig-patterns.md)*

## Internal Process

Do all of this work internally. Do NOT output it phase by phase.

1. **Classify the pattern(s)** -- map the user's request to Apple's 22 web-relevant patterns.
2. **Recommend independently from Apple HIG** -- apply pattern principles purely from Apple's wisdom.
3. **Compare against design.md and product-spec** -- identify alignments, conflicts, and gaps.
4. **Formulate the output** -- distill into the output format below.

### Pattern Catalog (apply what is relevant)

**Navigation & Structure**: Navigation (hierarchical/flat/content-driven, sidebar vs tab bar), Modality (focused tasks only, no stacking, clear dismiss), Searching (descriptive placeholders, live results, suggestions, scope), Launching (skeleton first screen, state restoration, no splash), Going Full Screen (toolbar on hover, easy exit, maintain state), Multitasking (size classes, never require full screen, container queries)

**Data & Input**: Entering Data (reduce effort, autofill, pickers > typing, inline validation), Drag and Drop (visual feedback, move vs copy, accessible alternatives), Undo and Redo (clear descriptions, scope to context, Cmd/Ctrl+Z), File Management (autosave, quick preview, contextual menus)

**Communication & Feedback**: Feedback (status/completion/error for every action, non-blaming, recovery paths), Loading (skeletons > spinners, determinate progress, background preload, never block UI), Managing Notifications (opt-in, deduplicate, appropriate timing, no destructive actions)

**Account & Privacy**: Managing Accounts (delay sign-in, passkeys, account deletion, explain benefits), Accessing Private Data (request in context, explain why, degrade gracefully), Settings (inline > separate page, don't duplicate system settings, immediate-apply)

**Social & Sharing**: Collaboration (presence, permissions, conflict resolution), Sharing (preview what's shared, copy-link default), Ratings and Reviews (after engagement, never interrupt, respect "not now")

**Guidance**: Onboarding (get to product fast, delay permissions, skip for returning users, teach by doing), Offering Help (contextual tips > static docs, progressive disclosure, keyboard shortcuts inline)

**Media**: Playing Audio/Video (standard controls, background playback, captions, remember position)

## Output Format

Present ONLY this to the user:

### Recommendations

A concise list of specific recommendations for the user's flow or pattern. Each item:
- **What to do** (one sentence)
- **Why** (one sentence citing the Apple HIG principle)

Keep it tight. 3-8 recommendations, ordered by impact.

### design.md / product-spec Evolution

Only include this section if there are meaningful conflicts or gaps. Skip it if everything aligns.

For each proposed change:
- **What**: The specific addition or modification (exact text)
- **Where**: File and section
- **Why**: One sentence on what it improves

Ask the user if they want to apply the changes.

## DO
- Produce the HIG recommendation independently before comparing
- Address both desktop and mobile contexts
- Reference accessibility for every pattern
- Be specific about web translations (CSS, HTML, ARIA, JS)

## DON'T
- Output the full analysis -- just the distilled recommendations
- Water down recommendations to avoid design.md conflicts
- Apply patterns dogmatically without product context
- Recommend native-only patterns without web equivalents
