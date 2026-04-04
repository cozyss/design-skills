# Writing Principles Reference

Distilled from Steven Pinker's *The Sense of Style: The Thinking Person's Guide to Writing in the 21st Century*, adapted for interface copy and product writing.

---

## 1. Classic Style

Write as if you're showing the reader something in the world. You can see it; they can't yet. Your job is to direct their gaze.

- **Writer and reader are equals.** You're having a conversation, not lecturing. Don't talk down, don't puff up.
- **The truth is known before writing begins.** You're presenting, not figuring it out on the page. If the writing sounds uncertain, the thinking probably is.
- **The reader is competent.** They'll get it if you give them a clear view. You don't need to over-explain.

### Applied to UI

Interface text is classic style at its most compressed. Every label, message, and instruction is the writer showing the user something: what happened, what to do, what's next. The user is competent — they just need a clear view.

---

## 2. The Curse of Knowledge

The single biggest cause of bad writing. You know something and can't imagine what it's like not to know it. Every writer is cursed — not because they're careless, but because they're human.

### How it shows up in UI

- Jargon that makes sense to the team but not the user ("webhook", "payload", "idempotent")
- Error messages that describe the system's state instead of the user's problem ("409 Conflict" vs "This email is already registered")
- Instructions that skip steps obvious to you but not to someone seeing this for the first time
- Labels that use internal product names instead of what the thing actually does

### Counterspells

1. **Cut jargon.** If you must use a technical term, explain it with a concrete example. Two examples are better — they let the reader triangulate the meaning.
2. **Climb down the abstraction ladder.** Replace abstract concepts with specific, concrete ones. "Authentication failure" → "Wrong password."
3. **Test with real readers.** Hand the text to someone from your audience. Watch where they pause or squint. That's where the curse lives.
4. **Wait and re-read.** Put distance between writing and editing. Fresh eyes catch what familiar ones miss.

---

## 3. Show, Don't Announce

Don't tell the reader what you're about to say. Just say it.

### Meta-discourse to kill

| Instead of | Just write |
|---|---|
| "In this section, we'll explain how to..." | [The explanation itself] |
| "It's important to note that..." | [The note itself] |
| "As mentioned previously..." | [Just state it again if needed] |
| "Let's take a look at..." | [Show the thing] |

### Applied to UI

- Don't write "Click the button below to save your changes." Write "Save."
- Don't write "This page allows you to manage your settings." Just show the settings.
- Don't write "Error: An error has occurred." Describe what actually happened.

---

## 4. Kill Zombie Nouns

Nominalizations — verbs turned into nouns — drain the life from sentences. They hide the actor and the action.

| Zombie noun | Alive |
|---|---|
| "make a modification" | "modify" or "change" |
| "perform a verification" | "verify" |
| "provide an indication" | "indicate" or "show" |
| "give a notification" | "notify" |
| "reach a decision" | "decide" |
| "make an adjustment to" | "adjust" |
| "conduct an analysis of" | "analyze" |

### Applied to UI

- "Deletion of your account" → "Delete your account"
- "Submission of the form" → "Submit" or "Send"
- "Confirmation of your selection" → "Confirmed" or "Got it"
- "Completion of setup" → "Setup complete"

---

## 5. Stop Hedging

Hedges signal that the writer doesn't trust their own words. They're contagious — the reader stops trusting too.

### Words to cut or justify

*somewhat, relatively, fairly, rather, quite, almost, nearly, presumably, apparently, arguably, to some extent, it could be said that, in a sense*

Each one earns its place only if it's genuinely load-bearing — if removing it would make the sentence false rather than merely less cautious.

### Applied to UI

- "Your file may have been uploaded" → "File uploaded" or "Upload failed"
- "This action might not be reversible" → "This can't be undone"
- "You may want to consider saving" → "Save your work?"

---

## 6. Coherence

Good sentences don't make good writing. Coherence does — the way ideas connect and flow.

### Three principles

1. **Lead with the point.** Don't bury it. The reader needs to know what they're looking at before they can understand the details. Newspaper editors call this "Don't bury the lede."

2. **Given before new.** Start sentences with what the reader already knows, then introduce what's new. This is how comprehension works — new information attaches to existing knowledge.

3. **One protagonist at a time.** Keep the reader following one actor. If you shift focus, do it deliberately and slowly. Jumping between subjects within a paragraph disorients.

### Applied to UI

- **The user is the default protagonist.** Prefer "you" or "your" over "I" or "we." "Your file was saved" not "We saved your file." First person is fine when it genuinely fits — but the default lens is the user's.
- Error messages: state what the user knows (what they tried) before what's new (what went wrong)
- Onboarding: build on what the user just learned, don't introduce three concepts at once
- Settings: group by what the user is trying to do, not by system architecture

---

## 7. Sentence Structure

### Light before heavy

Put simpler phrases before complex ones. The reader builds a mental scaffold — short, clear elements first, then the longer ones hang from them.

Bad: "The settings for notifications, email preferences, privacy, and account deletion that you configured during onboarding can be changed here."

Good: "Change your settings here — notifications, email, privacy, and account deletion."

### Keep related words together

Don't separate a verb from its object. Don't split a subject from its predicate with a long parenthetical. The reader holds the first part in memory while wading through the middle — if the middle is too long, they lose the thread.

### Parallel structure

Items in a list, options in a menu, steps in a flow — they should share the same grammatical form.

Bad: "You can export data, importing is also available, or deletion of records"
Good: "Export, import, or delete records"

---

## 8. Word Choice

- **Concrete beats abstract.** "Your photo" not "your uploaded media asset."
- **Specific beats vague.** "3 files deleted" not "items removed."
- **Short beats long.** "Use" not "utilize." "Help" not "assistance." "Show" not "display."
- **Familiar beats novel.** Don't coin terms when common words work. "Settings" not "Preferences Hub."
- **Verbs beat nouns.** "Save" not "Save operation." "Search" not "Perform search."

---

## 9. Pinker's Hierarchy

In order of importance:

1. **Classic style** — are you showing the reader something real?
2. **Coherent ordering** — do the ideas flow?
3. **Overcoming the curse of knowledge** — can the reader actually follow?
4. **Sound argumentation** — does it hold up?
5. **Correct usage** — grammar, spelling, punctuation

Most UI writing debates happen at level 5. The real problems are at levels 1-3.
