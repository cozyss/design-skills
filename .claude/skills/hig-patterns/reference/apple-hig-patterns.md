# Apple HIG Patterns Reference (Web-Adapted)

Apple Human Interface Guidelines interaction patterns translated for web. Each pattern: when to use, principles, best practices, anti-patterns, accessibility.

---

## Navigation & Structure

### Navigation

**When to use**: Every multi-section product. Choose the model before designing screens.

**Models** (web translations):

| Model | Web Pattern | Best For |
|-------|-------------|----------|
| Hierarchical | Sidebar with nested sections, breadcrumbs | Deep content, settings, file trees |
| Flat | Bottom tab bar (mobile), top nav tabs (desktop) | 3-5 equal-weight sections |
| Content-driven | Inline links, cards, recommendations | Media, articles, discovery |

**Practices**: Show current location with active states and `aria-current="page"`. Provide back affordance on every sub-screen (chevron-left or `history.pushState`). Persist scroll position on return. Limit top-level items to 5; overflow the rest. On mobile, collapse to hamburger or bottom sheet reachable with one hand.

**Avoid**: Navigation that changes structure by context. Losing scroll or form state on back. Icon-only nav without labels. Nesting >3 levels without breadcrumbs.

**A11y**: `<nav aria-label="Main navigation">`. Tab-style: `role="tablist"` / `role="tab"` / `role="tabpanel"` with roving tabindex.

---

### Modality

**When to use**: User must complete or abandon a focused task before continuing.

**Web modal hierarchy**:

| Type | Element | Use For |
|------|---------|---------|
| Alert | `<dialog>` + `showModal()` | Destructive confirmations, critical errors |
| Sheet | `<dialog>` or slide-up panel | Editing, composing, filtering |
| Popover | `[popover]` attribute | Menus, tooltips, supplementary info |

**Practices**: Use native `<dialog>` for focus trapping, Escape dismiss, `inert` on background. Always include a visible close button. Never stack modals -- redesign the flow. Animate: opacity + `translateY(8px)`, 150-200ms ease-out. Max width: 480px forms, 640px content.

**Avoid**: Modals for inline-able content (settings, help, status). Missing close button. Full-screen modals on desktop. Nested modals.

**A11y**: `aria-labelledby` pointing to title. Return focus to trigger on close.

---

### Searching

**When to use**: >20 items, or when users know what they want.

**Practices**: Descriptive placeholder ("Search conversations..." not "Search"). Show field prominently on desktop; icon-to-field on mobile. Live results debounced at 150-300ms. Show recents on empty focus. Support scope narrowing and `Cmd/Ctrl+K` shortcut. Persist query for refinement. Show count; explain zero results.

**Avoid**: Requiring Enter before results. Clearing field after selection. Exact-match only. Blank space for zero results.

**A11y**: `<search>` or `role="search"`. Input: `role="combobox"` with `aria-expanded`, `aria-controls`, `aria-activedescendant`. Results: `role="listbox"` / `role="option"`. Announce count via `aria-live="polite"`.

---

### Launching

**When to use**: Every app load -- cold start and return visit.

**Practices**: Render skeleton immediately (gray blocks matching layout). Fetch data in parallel with first paint (`<link rel="preload">`). Restore previous state for returning users (last conversation, scroll, sidebar) via `localStorage`. If auth required, show auth form directly -- no skeleton-then-redirect. Inline critical CSS; defer the rest. Use `content-visibility: auto` below the fold.

**Avoid**: Branded splash screens. Blank white screens during JS init. Multi-redirect chains. Loading all data before rendering.

**A11y**: `aria-busy="true"` on skeleton containers; remove when loaded.

---

### Going Full Screen

**When to use**: Media, focused editing, presentations, immersive content.

**Practices**: Use Fullscreen API (`element.requestFullscreen()`). Show toolbar on mouse move / tap; auto-hide after 3s. Support Escape to exit plus a visible exit button. Show "Press Esc to exit" hint on entry, fade after 2s. Preserve all state across transition.

**Avoid**: Forcing fullscreen for non-immersive content. Hiding controls with no reveal. Losing state on exit. Requesting fullscreen without user gesture.

**A11y**: Announce mode change via `aria-live="polite"`. Keep all controls keyboard-accessible. Respect `prefers-reduced-motion`.

---

### Multitasking

**When to use**: Any interface that may display at partial viewport width.

**Size classes**: Compact (<600px), Regular (600-1024px), Expanded (>1024px).

**Practices**: Use `@container` queries for component-level adaptation. Compact: collapse sidebar to overlay, stack panels, full-width. Regular: sidebar + content side-by-side. Expanded: multi-column, split views. Never disable features at smaller sizes -- adapt the path (e.g., move to a menu).

**Avoid**: Only handling desktop + phone breakpoints. Hiding functionality at small sizes. Fixed widths causing horizontal scroll. Assuming touch = small screen.

**A11y**: Test at 200% zoom. Touch targets minimum 44x44px at all sizes. Preserve DOM reading order across layout changes.

---

## Data & Input

### Entering Data

**When to use**: Any form or data collection.

**Practices**: Use specific input types (`email`, `tel`, `url`, `date`) for mobile keyboards and autofill. Set `autocomplete` attributes. Smart defaults; pre-select likely answers. Pickers over free text for constrained inputs. Validate on blur, not per-keystroke (exception: password strength). Show format hints before the user types. Group related fields with spacing. Preserve all input on error.

**Avoid**: Unnecessary fields. `type="text"` for everything. Per-keystroke validation flash. Clearing form on error. Placeholder-as-label.

**A11y**: Visible `<label for="id">` on every input. `aria-describedby` for hints and errors. `aria-invalid="true"` on error fields. `required` attribute + visible indicator. Error messages via `role="alert"`.

---

### Drag and Drop

**When to use**: Reordering, moving items between containers, file upload, spatial arrangement.

**Practices**: Grab: lift with scale(1.02-1.05) + shadow, `cursor: grabbing`. Drag: translucent preview, highlighted drop targets (dashed border or background). Drop: animate to position (150ms ease-out). Alt/Option to copy (show "+" badge). File upload: full-area drop zone on `dragenter`. Use HTML DnD API or library (dnd-kit, Sortable.js).

**Avoid**: DnD as only interaction (inaccessible). No visual feedback. Tiny drop targets. No cancel on drop-outside.

**A11y**: Always provide button/keyboard alternatives ("Move up/down", arrow keys). `aria-roledescription="sortable"`. Announce moves: "Item moved to position 3 of 7" via `aria-live="assertive"`.

---

### Undo and Redo

**When to use**: Any destructive or significant state change.

**Practices**: Remove immediately, show undo toast (5-8s), delete on expiry. Specific labels: "Undo delete 'Project Alpha'". Support `Cmd/Ctrl+Z` / `Cmd/Ctrl+Shift+Z`. Maintain context-scoped undo stack. Reserve confirmation dialogs for truly irreversible actions only.

**Avoid**: "Are you sure?" for every delete. Generic "Undo" labels. No undo at all. Cross-context undo.

**A11y**: Toast with `role="status"`. Keyboard-focusable undo button. Announce result: "Delete undone. 'Project Alpha' restored." Pause auto-dismiss on focus.

---

### File Management

**When to use**: User-created files, documents, uploads.

**Practices**: Autosave with debounce (1-2s); show subtle "Saved" indicator. Quick preview via `<dialog>` or side panel. Context menu (right-click / long-press): Open, Rename, Duplicate, Move, Delete. Recognizable file-type icons from MIME type. Upload: drag-and-drop + picker, determinate progress, cancellable. Show last-modified and size.

**Avoid**: Manual save. No preview. Actions only in top menu. Raw file extensions.

**A11y**: File lists: `role="grid"` or `role="listbox"` with arrow-key nav. Context menus: `role="menu"` / `role="menuitem"`. Progress: `role="progressbar"` with `aria-valuenow`.

---

## Communication & Feedback

### Feedback

**When to use**: After every user action.

**Hierarchy**:

| Level | Method | Use For |
|-------|--------|---------|
| Subtle | Inline state change (check, color) | Toggle, save, select |
| Moderate | Toast (4-6s auto-dismiss) | Success confirmation, minor errors |
| Prominent | Inline banner (until resolved) | Form errors, warnings |
| Critical | Modal alert (requires response) | Destructive confirm, data loss risk |

**Practices**: Success: brief ("Message sent"). Errors: specific and actionable near the source. In-progress: visible indicator. Long operations: notify even after navigation. Never blame the user. Rate-limit: no toast per auto-save.

**Avoid**: Silent button clicks. Toasts for trivial actions. Technical error messages. <4s toast duration.

**A11y**: Toasts: `role="status"`, `aria-live="polite"`. Errors: `role="alert"`, `aria-live="assertive"`. Never color-only -- pair with icon and text.

---

### Loading

**When to use**: Operations >100ms.

**Patterns**:

| Pattern | When |
|---------|------|
| Skeleton screen | Page load, section refresh |
| Inline spinner | Button action, validation |
| Progress bar (`<progress>`) | Upload, computation, multi-step |
| Optimistic update | Low-stakes (like, toggle, reorder) |
| Background preload | Pagination, prefetch |

**Practices**: Skeletons: match layout, shimmer animation (`1.5s infinite`). >2s: show elapsed/estimated time. >10s: allow other tasks, show progress non-blocking. Preload likely next data (`IntersectionObserver`). Disable trigger during load; show spinner inside button.

**Avoid**: Full-page blocking spinner. Indeterminate for known-duration ops. Layout shift on load. No indication.

**A11y**: Skeletons: `aria-busy="true"`. Progress: `role="progressbar"` with `aria-valuenow/min/max` and label. Spinners: `role="status"` with hidden "Loading" text. Announce completion via `aria-live="polite"`.

---

### Managing Notifications

**When to use**: Events outside the user's current focus.

**Practices**: Permission: opt-in only, request when user takes a relevant action. Group and deduplicate. Queue during focused work; deliver on pause. In-app: bell icon with badge count. Preferences inline near relevant features.

**Avoid**: Permission on page load. Persistent "N unread" banners. Destructive actions in notifications. Per-message duplicates. No frequency controls.

**A11y**: `aria-live="polite"` for in-app. Badge: `aria-label="Notifications, 3 unread"`. List: `role="log"`. Keyboard-navigable.

---

## Account & Privacy

### Managing Accounts

**When to use**: Sign-up, sign-in, profile, settings, deletion.

**Practices**: Delay account requirement -- show value first. Support passkeys (WebAuthn), email/password, social login. Minimal creation (email or email+name). Remember email on sign-in. Explain each field's benefit. Profile: avatar/initials in predictable corner. Deletion: in settings, confirmation step, stated timeframe.

**Avoid**: Account wall before value. >3 fields on sign-up. Hidden/impossible deletion. Unexplained data collection. Session expiry without state save.

**A11y**: `autocomplete="username"` / `autocomplete="current-password"` / `autocomplete="new-password"`. Non-leaking errors ("Incorrect email or password"). Never disable paste on passwords.

---

### Accessing Private Data

**When to use**: Access to user data, device features (camera, location, mic), third-party accounts.

**Practices**: Request in context when the feature is used, not on launch. Pre-permission screen explaining why. On denial: explain limitation and how to re-enable. Never request unneeded permissions. Privacy summary in account settings. Clipboard: `navigator.clipboard` on user gesture only.

**Avoid**: All-permissions-on-launch. Blocking app on denial. No explanation. Unneeded requests. Silent collection.

**A11y**: Explanations must be visible (not tooltip-only). Denial fallbacks must clearly state the limitation.

---

### Settings

**When to use**: User configuration of app behavior or appearance.

**Practices**: Inline controls that apply immediately (toggles, radios) -- no Save button. Group by task/feature, not control type. Show current value inline ("Theme: Light"). Respect system settings by default. Sensible defaults. Searchable if many settings.

**Avoid**: Massive settings page (use progressive disclosure). Save buttons for immediate-apply settings. Silent reset-to-defaults. Unexplained options. Duplicating OS settings.

**A11y**: Toggles: `role="switch"` + `aria-checked`. Group with `<fieldset>` / `<legend>`. Announce changes: `aria-live="polite"`.

---

## Social & Sharing

### Collaboration

**When to use**: Multiple users on the same content, sync or async.

**Practices**: Presence indicators (avatar stack / initials). Real-time: cursors or selection with name labels. Clear permission display ("You can edit/view"). Conflict resolution: last-write-wins with notification for simple fields; OT/CRDT for text. Activity feed with who/what/when. WebSocket + connection status indicator.

**Avoid**: No presence. Silent overwrites. Complex permission models. Refresh-to-update.

**A11y**: Presence: `aria-label="3 people viewing: Riley, Alex, Jordan"`. Changes: `aria-live="polite"` for significant updates. Permission changes: `role="alert"`.

---

### Sharing

**When to use**: Distributing content to others inside or outside the app.

**Practices**: Share dialog with content preview, recipients, and permission level. Default options: Copy link, Email, platform-specific. Copy-link via `navigator.clipboard.writeText` with instant "Link copied" confirmation. Permission controls in dialog. Show share status on items.

**Avoid**: Sharing without preview. No copy-link. Too many options (3-5 primary). No shared-status indicator.

**A11y**: Dialog: `role="dialog"` + `aria-label="Share"`. Copy confirm: `role="status"`. Descriptive labels ("Share via email" not icon-only).

---

### Ratings and Reviews

**When to use**: Gathering user feedback on the product or content.

**Practices**: Trigger after meaningful engagement (task complete, repeated use). Simple initial prompt with 2-3 options. Positive: invite review. Negative: open feedback form. "Not now" doubles interval. "Don't ask again" is permanent. Confirm receipt. Follow up on reported problems.

**Avoid**: Asking on first use. Interrupting mid-task. No dismiss option. Ignoring negative feedback. Persistent nag.

**A11y**: Ratings: `role="radiogroup"` / `role="radio"`. No auto-playing animations on prompts.

---

## Guidance

### Onboarding

**When to use**: First-time users, major features, significant redesigns.

**Practices**: Get to product fast. Always show "Skip." Progressive disclosure: one concept per step. Delay permission requests until the relevant feature. Empty states as onboarding: "Your conversations appear here. Start typing." Track completion in `localStorage`. Under 3 steps; each step = doing, not reading. Show progress ("Step 1 of 3").

**Avoid**: Multi-screen tutorials blocking the product. Passive screenshot walkthroughs. Forced onboarding. Re-showing to returning users. Batching all permissions.

**A11y**: Progress: `role="progressbar"` or `aria-label="Step 1 of 3"`. Manage focus on overlay show/dismiss. All content screen-reader-accessible.

---

### Offering Help

**When to use**: Users who are confused, stuck, or unaware of a capability.

**Practices**: Contextual tips at point of need via `[popover]` or tooltip. Inline shortcut hints with `<kbd>` ("Cmd+K" next to search). Searchable help within the interface. Progressive: (1) tooltip, (2) "Learn more" to panel, (3) full docs. FAQ with `<details>`/`<summary>`. Help in context (inline panel, popover), not a new tab.

**Avoid**: Static help as only mechanism. "?" icons on everything. Help in new tab. Jargon. UI-describing help ("Click the blue button" vs. "Press Enter to send").

**A11y**: Tooltips: `role="tooltip"` + `aria-describedby`. `<kbd>` containers with `aria-label` ("Command K"). `<details>`/`<summary>` natively accessible; custom: use `aria-expanded`.

---

## Media

### Playing Audio/Video

**When to use**: Any audio or video playback.

**Practices**: Native `<video>` / `<audio>` with `controls` as baseline. Custom controls: play/pause, scrubber, volume, speed (0.5-2x), fullscreen, captions. Remember position in `localStorage` (>1min content). Keyboard: Space (play/pause), Arrow (seek 5s), M (mute), F (fullscreen). Show title, duration, current time. Audio: waveform/progress visualization. Support background playback.

**Avoid**: Autoplay with sound. Non-keyboard custom controls. No speed options. Restarting on navigation. No captions.

**A11y**: Captions: `<track kind="captions">`. Transcripts as alternative. Scrubber: `role="slider"` with `aria-valuenow/min/max`, `aria-label="Playback position"`. Play/pause: toggle `aria-label`. Captions toggle: `aria-pressed`. Respect `prefers-reduced-motion`.
