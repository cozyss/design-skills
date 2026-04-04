# Apple HIG Components Reference (Web-Adapted)

Knowledge base for Apple HIG component principles translated to web (HTML/CSS/ARIA/JS). Reference material for the hig-components skill -- no workflow instructions.

---

## Content

### Charts & Data Visualization

Select chart type from the data-type/question matrix, apply the five design topics, use progressive disclosure, and ensure data accessibility.

#### Chart Type Selection

| Data Type | Question | Chart |
|-----------|----------|-------|
| Value over time | How has this changed? | Line |
| Multiple series over time | How do these compare? | Multi-line |
| Parts of a whole | Composition? | Stacked bar, pie (max 5 segments) |
| Category comparison | Which is larger? | Bar (horizontal for long labels) |
| Distribution | How is this spread? | Histogram, box plot |
| Correlation | Related? | Scatter plot |
| Ranking | Order? | Ordered bar |
| Flow/process | How does this move? | Sankey, funnel |

#### Five Design Topics

**Marks**: Points for discrete, lines for trends, bars for categories, areas for cumulative. Choose the mark matching the data type.

**Axes**: Label with units. Start numeric at zero unless justified. Sensible tick intervals. Time axes left-to-right. Never angle labels -- shorten or go horizontal.

**Descriptions**: Title describes the insight, not the data ("Revenue grew 40% in Q3" not "Revenue by Quarter"). Annotate key points. Position legends clear of data.

**Interaction**: Summary value -> chart on demand -> detail on hover/tap. Tooltips for exact values. Crosshairs for axis location. Pinch-to-zoom on dense charts.

**Color**: Limit categorical palettes to 6-8 hues. 3:1 minimum contrast between adjacent elements. Always pair color with a non-color differentiator (patterns, shapes, labels) for color blindness. Sequential data: single-hue light-to-dark. Diverging data: two hues meeting at neutral midpoint.

#### Progressive Disclosure in Charts

1. **Summary**: Prominent number or trend statement ("+12% this month")
2. **Chart**: Visual representation revealed on demand or scroll
3. **Detail**: Exact values via interaction (tooltip, drill-down, hidden data table)

#### Chart Accessibility

- Container: `role="img"` + descriptive `aria-label` summarizing the insight
- Hidden `<table>` with underlying data for screen readers
- Keyboard: arrows between data points, Enter for detail
- Pattern fills alongside color for series differentiation
- Live charts: `aria-live="polite"` for data changes
- 3:1 contrast between chart elements and background

### Image Views

**Purpose**: Display images with correct resolution, aspect ratio, and accessibility.

- Serve resolution-appropriate images (`srcset`/`<picture>`) for density and viewport
- Preserve ratio with `object-fit: cover` or `contain` -- never stretch
- Lazy-load below fold (`loading="lazy"`). Use `aspect-ratio` CSS to prevent layout shift.
- Alt text: meaningful content description. Decorative: `alt=""` + `role="presentation"`. Complex images: `aria-describedby`.

**Do**: Reserve space with aspect-ratio to eliminate CLS.
**Don't**: Use background-image for meaningful content. Don't rely on images alone for critical information.

### Text Views

**Purpose**: Readable text adapting to preferences and length.

- Line length 45-75 characters. Line height 1.4-1.6 body, 1.2-1.3 headings.
- `rem` units for Dynamic Type equivalent. Scrollable long content with visible affordance.
- Support 200% resize without content loss (WCAG 1.4.4).

**Do**: `max-width` in `ch` units. **Don't**: `overflow: hidden` without "show more". Don't disable text selection.

---

## Layout & Organization

### Lists and Tables

**Purpose**: Scannable rows of related data.

- Row-based for text, grid for visual content. Clear selection feedback (background highlight).
- Sortable columns with visible direction indicators.

**States**: default, hover (background), selected (background + weight), disabled (opacity, `pointer-events: none`).
**Sizing**: 44px min row height on touch. Padding 12-16px vertical, 16-20px horizontal.
**ARIA**: `<table>`/`<thead>`/`<th scope>` for tabular; `<ul>`/`<ol>` for lists. `aria-sort` on sortable headers. Arrow keys navigate, Enter activates.

**Do**: Alternating tints only when density demands it.
**Don't**: Table for layout. Don't make entire row clickable when cells have distinct actions.

### Collections

**Purpose**: Groups of items in grid or list with optional reorder.

- Grid for visual, list for text. Drag reorder: handle cursor + drop-target highlight.
- Keyboard alternative: move-up/down buttons. Responsive via `auto-fit`/`minmax()`.
- `role="list"` or `role="grid"`. Show item count and empty state.

### Split Views

**Purpose**: Primary/secondary pane layout.

- Primary leading (240-320px), secondary fills rest. Collapse below 400px secondary min.
- Resize handle: `cursor: col-resize`. Primary: `<nav>`. Persist widths.
- Focus moves to secondary on item selection. Don't nest. Max 40% for primary.

### Tab Views

**Purpose**: Switch between related content panes.

- 3-5 tabs max. Always visible. Navigate views, never trigger actions. Concrete noun labels.

**States**: default, hover (background), active (border-bottom/fill + weight), focus (outline), disabled.
**Sizing**: 44-48px bar height. Equal-width when 3 or fewer.
**ARIA**: `role="tablist"` > `role="tab"` (`aria-selected`, `aria-controls`) > `role="tabpanel"` (`aria-labelledby`). Active: `tabindex="0"`, others `-1`. Left/Right arrows, Tab into panel.

**Do**: Persist selected tab across navigation.
**Don't**: Tabs for sequential steps (use stepper). Don't nest tabs.

### Disclosure Controls

**Purpose**: Progressive detail revelation.

- `<details>`/`<summary>` for simple cases. Custom: `aria-expanded` + `aria-controls` on trigger.
- Chevron indicates expandability. Animate expand/collapse.

**States**: collapsed (chevron right), expanded (chevron down), hover (trigger tint), focus (outline), disabled.
**Keyboard**: Enter/Space toggles. Allow multiple open unless mutually exclusive.

**Don't**: Nest more than two levels. Don't hide primary content behind disclosure.

### Labels

**Purpose**: Unambiguous element identification.

- Title-style caps for short labels, sentence case for descriptions.
- `<label for>` for inputs, `aria-label` for non-form elements.
- Never truncate without tooltip. Place above or left of element.

**Don't**: Placeholder as sole label.

### Toolbars

**Purpose**: Surface frequent actions.

- Primary visible, secondary in "more" menu. Collapse: labels -> icons -> overflow.
- `role="toolbar"` + `aria-label`. 44-48px height, 44px targets.
- Arrow keys between items, Tab exits. Group with separators. Max 7-9 visible actions.

### Sidebars

**Purpose**: Persistent app-level navigation.

- Leading side, 240-320px expanded, 48-64px icon-only. Outlined icons; filled for active.
- `<nav>` + `aria-label`. `aria-current="page"` on active. `aria-expanded` on collapse toggle.

**States**: default, hover (tint), active (fill + weight), focus (outline).
**Sizing**: 44px min item height. Max two nesting levels.

---

## Menus & Actions

### Buttons

**Purpose**: Trigger actions.

- Hierarchy: plain < bordered < filled. One filled per view.
- 44px min touch target. Verb labels (Save, Delete) not generic (OK, Yes).

**States**:
- Default: resting. Hover: background/border change. Active: darker or `scale(0.97)`.
- Disabled: opacity 0.4-0.5, `aria-disabled="true"`. Focus: 2px outline, never removed.

**Sizing**: 44px min height, 16-24px horizontal padding. Icon-only: 44x44px.
**HTML**: `<button>` for actions, `<a>` for navigation. `aria-label` on icon-only. Prefer `aria-disabled` over `disabled` attribute.

**Do**: Verb labels. Tooltip on disabled buttons explaining why.
**Don't**: Multiple filled per view. Don't remove focus styles.

### Context Menus

**Purpose**: Contextual actions for the target element.

- Relevant items only. Mirror critical items in main UI. One submenu max.
- `role="menu"` > `role="menuitem"`. Right-click or Shift+F10. Arrows, Enter, Escape.

**Do**: Keyboard shortcuts next to items.
**Don't**: Essential functionality only in context menus.

### Menus (General)

**Purpose**: Command/option lists.

- Frequent first, destructive last (separated). Ellipsis for dialog-opening items.
- Disable > hide unavailable. Shortcuts right-aligned. Group with `role="separator"`.
- `role="menu"` > `role="menuitem"`. `aria-disabled` for unavailable. Arrows, Enter, Escape, Home/End.

**Don't**: More than 12-15 items without grouping. Don't hide unavailable items.

### Pop-Up Buttons

**Purpose**: Select from mutually exclusive options (web: `<select>` or custom).

- Shows current selection as label. Useful default. Checkmark on selected.
- Custom: `role="listbox"` > `role="option"` + `aria-selected` + `aria-expanded`.

**Don't**: Fewer than 3 options (use radios or segmented control).

### Pull-Down Buttons

**Purpose**: Actions (not selections) from a single button.

- Label names the action category. Items perform immediately. No submenus.
- `aria-haspopup="true"` + `aria-expanded`. Chevron-down indicator.

**Don't**: Mix selections and actions.

---

## Navigation & Search

### Navigation Bars

**Purpose**: Title + back + contextual actions.

- Back leading, title center/leading, max one trailing action. 44-48px height.
- `<header>` or `<nav>`. Back: `aria-label="Go back"`.

**Don't**: Breadcrumbs on mobile. More than one trailing action.

### Tab Bars (Bottom Navigation)

**Purpose**: Persistent mobile navigation, bottom-anchored.

- 3-5 items, always visible. Icon + text label. Concrete nouns.

**States**: default (muted), active (accent/full-weight). 48-56px height, 44px targets.
**ARIA**: `role="navigation"`. `aria-current="page"` on active.

**Don't**: Actions in tab bar. More than 5 items. Text-only items.

### Search Fields

**Purpose**: Find content by query.

- `<input type="search">` or `role="searchbox"`. Descriptive placeholder.
- Clear button when non-empty: `aria-label="Clear search"`. Token/chip filters.
- Scope selector for multiple content types. Results: `aria-live="polite"`.

**Sizing**: 36-44px height. Clear 24-32px. Tokens 28-32px (44px touch). Debounce 200-300ms.

**Do**: Show result count. **Don't**: Clear field on submit. Don't require Enter with search-as-you-type.

### Path Controls (Breadcrumbs)

`<nav aria-label="Breadcrumb">` > `<ol>`. Current page: `aria-current="page"` (plain text). Truncate long paths with ellipsis menu keeping first and last. Don't show on top-level page.

### Token Fields

**Purpose**: Values as removable tag chips.

- Each token: `<button>` with `aria-label="Remove [value]"`. 44px touch per remove.
- Comma/Enter creates token. Backspace removes last at position 0.

**Don't**: Unremovable tokens. Duplicates without confirmation.

---

## Presentation

### Alerts (Dialogs)

**Purpose**: Demand attention for important information or confirmation. Use sparingly.

- `<dialog>` + `showModal()`. `role="alertdialog"` for acknowledgment, `role="dialog"` general.
- `aria-labelledby` title, `aria-describedby` body. Focus traps on open, returns on close.

**Title**: Specific ("Delete 3 files?") not generic ("Warning").
**Buttons**: Verbs (Delete, Discard) not Yes/No. Safe action leading, destructive trailing.
**Sizing**: 280-400px width, 44px button height.
**Keyboard**: Escape closes (when cancel allowed), Tab cycles within.

**Do**: Consider inline messaging before modal. **Don't**: Stack alerts. Don't use Yes/No.

### Popovers

**Purpose**: Transient contextual content anchored to trigger.

- One at a time. Arrow to trigger. Dismiss: outside click or Escape.
- `aria-haspopup="dialog"` + `aria-expanded` on trigger. `role="dialog"` + `aria-label`.
- Persist editable content on dismiss. Flip to avoid viewport overflow.

**Sizing**: Max-width 320px. Padding 12-16px.

**Don't**: Nest popovers. Don't put critical functionality inside.

### Sheets

**Purpose**: Scoped single task without full navigation change.

- `role="dialog"`, `aria-modal="true"`. Focus trap. Swipe-dismiss on mobile (drag handle).
- Confirm before dismissing unsaved data. Never stack.

**Sizing**: Mobile: full-width, 50-90% height. Desktop: centered, 400-600px.

**Do**: Visible close affordance alongside swipe. **Don't**: Stack. Don't put navigation in sheets.

### Action Sheets

**Purpose**: Destructive confirmation choices.

- Cancel always last. Destructive option visually distinct (red/separated).
- Bottom on mobile, popover on desktop. `role="dialog"`, items are `<button>`.

**Sizing**: 44px item height, 14-16px padding. Max 6-8 actions.

### Scroll Views

**Purpose**: Content exceeding visible area.

- No nested same-axis scrolling. `scroll-snap` for paged content.
- `tabindex="0"` + `role="region"` + `aria-label` on scrollable containers.
- Show indicators on hover/scroll. Scroll-to-top for long lists.

**Don't**: Hijack scroll behavior. Don't permanently hide scrollbars.

### Page Controls

**Purpose**: Position indicator for paged/carousel views.

- Active dot distinct (larger/filled). Max ~20 pages.
- `role="tablist"` > `role="tab"` per dot. `aria-label="Page N of M"`. Arrow keys navigate.

### Tooltips

**Purpose**: Brief contextual help on hover/focus.

- One line, under 80 chars. ~0.5s hover delay, immediate on focus.
- `role="tooltip"` + `aria-describedby`. Max-width 200-240px, 12-13px font.

**Do**: Use for icon-only buttons. **Don't**: Interactive content. Don't show on touch (use tap alternative).

---

## Selection & Input

### Text Fields

**Purpose**: User text input.

- `<label for>` on every field. Placeholder supplements, never replaces label.
- `type`/`inputmode` for keyboard (`email`, `tel`, `numeric`). Clear button. `autocomplete`.
- Validate on blur: `aria-invalid="true"` + `aria-describedby` for error. `aria-required` for mandatory.

**States**: default, focused (border emphasis), filled, error (border + message), disabled.
**Sizing**: 44px min height. Label above with 4-8px gap.

**Do**: Pre-fill known values. Character count for limited fields.
**Don't**: Placeholder as sole label. Don't validate on every keystroke. Don't clear on error.

### Pickers

**Purpose**: Select from medium-to-long option lists.

- `<select>` for simple. Custom: `role="listbox"` > `role="option"` + `aria-selected`.
- Logical order. Type-to-filter for long lists. Checkmark on selected.

**Don't**: Fewer than 5 options (use radios). Don't force scrolling without search.

### Segmented Controls

**Purpose**: 2-5 mutually exclusive view modes.

- Equal width. `role="radiogroup"` > `role="radio"` + `aria-checked`. Arrow keys, selection follows focus.

**States**: default, hover, selected (fill/weight), focus (outline), disabled.
**Sizing**: 32-40px height. Padding 8-16px per segment.

**Don't**: More than 5 (use tabs). Don't use for actions.

### Sliders

**Purpose**: Value from continuous or discrete range.

- `<input type="range">` or `role="slider"` + `aria-valuemin/max/now/text`.
- Track fill to current value. End icons when meaning unclear. Pair with numeric readout.

**States**: default, hover (thumb enlarges), dragging (elevated), focus (outline), disabled.
**Sizing**: Track 4-6px. Thumb 20-24px (44px touch target). Arrows adjust, Page Up/Down jumps, Home/End bounds.

**Don't**: Fewer than 5 values (use stepper). Don't omit numeric readout for precise input.

### Steppers

**Purpose**: Increment/decrement by fixed step.

- Two `<button>` + `aria-label="Decrease/Increase [prop]"` + live value (`aria-live="polite"`).
- Disable at min/max. 44px targets. Allow direct text editing.

**Don't**: Ranges > 20 values (use slider or text input).

### Toggles (Switches)

**Purpose**: On/off for a single setting, immediate effect.

- `role="switch"` + `aria-checked`. Label left, toggle right. No redundant on/off text.

**States**: off (muted track, thumb leading), on (filled track, thumb trailing), hover, focus, disabled.
**Sizing**: Track 36-44px wide, thumb 18-22px, 44px total target. Enter/Space toggles.

**Do**: Visually distinct on vs off. **Don't**: Multi-state. Don't use for actions needing confirmation.

### Date Pickers

**Purpose**: Date (and optional time) selection.

- `<input type="date">` for simple. Custom: `role="dialog"` calendar + `role="grid"`.
- Compact (trigger button) or inline. Quarter-hour time. Pre-select today when appropriate.
- Always allow manual text entry as alternative.

### Combo Boxes

**Purpose**: Free-text + filterable suggestions.

- `role="combobox"` + `aria-expanded` + `aria-controls` (listbox) + `aria-activedescendant`.
- Filter on type. Highlight matching text. Allow free-text submission.

---

## Status

### Progress Indicators

**Purpose**: Communicate ongoing work and remaining effort.

- Determinate: `role="progressbar"` + `aria-valuenow/min/max`. Indeterminate: no value attrs.
- Always animated -- frozen looks broken. `aria-live="polite"` for milestones.
- `prefers-reduced-motion`: static fallback.

**Sizing**: Bar 4-6px height. Spinner 16-24px inline, 32-48px page-level.

**Do**: Label for operations > 3s. **Don't**: Spinner for < 300ms. Don't freeze mid-operation.

### Gauges

**Purpose**: Value within a known range.

- `<meter>` or `role="meter"` + `aria-valuenow/min/max`. Fill/arc + numeric readout.
- Color zones when semantically meaningful. Width 48-120px.

### Level Indicators

**Purpose**: Discrete capacity/strength levels.

- 3-5 segments. `role="img"` + `aria-label="[Level]: N of M"`. Color at thresholds + text label.

**Don't**: More than 5 segments. Don't rely on color alone.

### Rating Indicators

**Purpose**: Star-based ratings.

- Display: `role="img"` + `aria-label="Rating: N of 5"`. Input: `role="radiogroup"` > `role="radio"`.
- Display 16-24px, interactive 32-44px touch. Half-star when appropriate.

**Do**: Numeric value alongside stars. **Don't**: Non-standard scales in a star component.
