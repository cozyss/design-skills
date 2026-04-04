---
name: write
description: Write and rewrite interface copy using Steven Pinker's principles from The Sense of Style. Covers buttons, labels, error messages, onboarding, empty states, descriptions, tooltips, and any text a user reads. Use when writing new copy, reviewing existing copy, or when invoked by /design or /design-review for text-related work.
user-invocable: true
---

Write interface copy that's clear, concrete, and human. Grounded in Steven Pinker's *The Sense of Style*.

-> *Consult [Pinker's writing principles](reference/pinker-principles.md)*

## Process

### 1. Identify the Copy

Read the code or UI. Find every piece of text the user sees:
- Page titles, section headings
- Button and link labels
- Form labels, placeholders, hints
- Error messages, success messages, warnings
- Empty states
- Onboarding and instructional text
- Tooltips, descriptions, helper text
- Confirmation dialogs
- Loading and progress messages
- Notification text

### 2. Evaluate Against Pinker's Principles

For each piece of copy, check — internally, don't output this step-by-step:

**Classic style?** Is this showing the user something real, or is it announcing, hedging, or performing?

**Curse of knowledge?** Would someone new to this product understand it immediately? Is there jargon, assumed context, or skipped steps?

**Zombie nouns?** Are there nominalizations hiding the real action? ("Modification of settings" instead of "Change settings")

**Hedging?** Is the text weaker than it needs to be? ("Your file may have been saved" instead of "File saved")

**Coherence?** Does the text lead with what matters? Given before new? One idea at a time?

**Concrete and specific?** Or abstract and vague?

### 3. Rewrite

For each problem found, rewrite the copy. Present changes as a table:

| Where | Before | After | Why |
|---|---|---|---|
| [location] | [original text] | [rewritten text] | [one-sentence reason citing the principle] |

Group by severity — the worst offenders first.

### 4. Apply

After the user reviews, make the changes in the code. Match the exact strings in the source files.

## Principles (Quick Reference)

These are the lenses to apply, in priority order:

1. **Show, don't announce.** Say the thing. Don't say you're about to say the thing.
2. **Fight the curse of knowledge.** You are not your user. Cut jargon. Add context they need, not context you'd need.
3. **Kill zombie nouns.** "Save" not "perform a save operation." Verbs do the work.
4. **Stop hedging.** Be direct. "This can't be undone" not "this action might not be reversible."
5. **Lead with the point.** The most important information comes first. Don't bury it.
6. **Given before new.** Start with what the user knows, then introduce what's new.
7. **Concrete beats abstract.** "3 photos" not "selected items." Specific beats vague.
8. **Short beats long.** "Use" not "utilize." "Help" not "assistance."
9. **Prefer "you" over "I" or "we".** Lead with the user as protagonist. "Your file was saved" not "We saved your file." Default to "you" — use first person only when it genuinely serves the message.
10. **Parallel structure.** Lists, options, and steps share the same form.
11. **One idea per message.** Don't overload a single string with multiple concepts.

## Tone Calibration

Adapt the voice to the product's tone (read `design.md` if available), but never sacrifice clarity for tone. A playful app still needs clear error messages. A serious enterprise tool can still sound human.

- **Serious product:** Clear, direct, professional. No jokes in errors. Confidence without coldness.
- **Consumer product:** Warm, conversational, encouraging. Celebrate wins. Soften failures without hedging.
- **Developer tool:** Precise, technical where appropriate, no dumbing down. Jargon is fine if it's the user's jargon.

## DO
- Read `design.md` for tone and voice guidelines before writing
- Rewrite the actual strings in the codebase, not just suggest changes
- Test copy by reading it aloud — if it sounds weird spoken, it reads weird too
- Use the same word for the same concept everywhere (don't alternate between "delete" and "remove" for the same action)
- Write errors that tell the user what happened AND what to do next

## DON'T
- Default to "I" or "we" when "you" would work — the user is the protagonist
- Sacrifice clarity for cleverness
- Use different words for the same action across the interface
- Write placeholder copy and move on — placeholders ship
- Add personality to error states that need urgency ("Oopsie! Your payment failed")
- Hedge when the system knows the answer ("File may have been deleted" when it definitely was)
