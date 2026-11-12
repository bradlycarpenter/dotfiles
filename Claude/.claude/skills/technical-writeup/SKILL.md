---
name: technical-writeup
description: Bradly's house style for any write-up, explainer, report, investigation, proposal or incident analysis meant for colleagues, especially as an HTML artifact or page. Use whenever you write or restyle a document that explains a technical problem, its evidence and options, even when no style is mentioned.
---

# Technical write-up

Write and design like a technical study: flat, factual, no sales voice. The page should read like a well-made old technical manual, with a modern, Vercel-like finish in Claude's colours.

## Writing

- Impersonal and measured. No "we", no "you", no headlines that dramatise ("Production is running out of…"). Title states the subject: "Database connection exhaustion in the X deployment".
- Open with a short unlabelled summary paragraph: what happened, the cause, the recommendation and its cost. No "Abstract", "TL;DR" or "Summary" label.
- Numbered sections in the order of a study: Introduction, System description, Method, Results, Analysis, Options considered, Recommendation, Limitations and open questions, Decisions required. Then appendices: Terms, References. Drop sections that would be empty.
- State measured facts with their source and period; keep estimates visibly separate and say how they were derived. Put unknowns in Limitations, not scattered hedges.
- Numbered references at the end, cited inline as [n]. Name files as `path:line`.
- No fluff or self-description: no "Technical report" labels, document or revision numbers, "End of report" footers, or stage directions. No sentence anywhere describes the document itself ("This report describes…", "This write-up records…"); the Introduction states the problem and why it matters, nothing about the page.
- No captions or subtexts that restate what the figure or table obviously shows ("Production database connections, five busiest hours"). Keep a caption only when it explains something not self-evident, such as what a dashed outline means. Don't refer to "Table 2" or "Figure 1"; write the sentence so the reader looks below.
- Don't show the same data twice (a chart and a table of the same numbers). Pick one.
- UK English, short sentences.

## Design

- Use `style.css` in this skill's folder as the stylesheet: copy it into the page's `<style>` and load Geist and Geist Mono from Google Fonts (`family=Geist:wght@400;500;600&family=Geist+Mono:wght@400;500`).
- Palette (Claude): paper `#faf9f5`, panel `#f0eee6`, ink `#141413`, muted `#6b6a64`, rule `#d8d5ca`, accent clay `#c96442`. Dark: paper `#1f1e1d`, panel `#262624`, ink `#f0eee6`, clay `#d97757`. Clay marks only section numbers, links and the one thing a chart must draw the eye to; everything else is ink, grey and rules.
- Manual traits: a boxed header plate holding the title and two or three plain metadata cells (date, period observed); each section opens with a heavy ink rule and an uppercase mono heading with a two-digit clay number (`01`, `02`, appendices `A`, `B`); figures sit in flat ruled panels; tables use heavy top and bottom rules with mono uppercase column heads and right-aligned tabular numbers; terms as a ruled two-column list.
- Flat: no shadows, gradients, rounded cards, pills, badges, big coloured stat numbers, emoji or decorative meters. Charts are monochrome inline SVG with one clay highlight and a dashed clay line for a limit.
- Layout: one reading column of about 760px, mobile-safe (tables in an `overflow-x: auto` wrapper, header grid collapses to one column).

## Structure of the page

```html
<header class="plate">
<div class="plate-body"><h1>Subject stated plainly</h1></div>
<div class="plate-grid"><div><span>Date</span>…</div><div><span>Period observed</span>…</div></div>
</header>
<div class="abstract"><p>Summary paragraph.</p></div>
<h2><span class="no">01</span>Introduction</h2>
<h3><span class="no">4.1</span>Sub-section</h3>
<figure>…svg…</figure>
<div class="tbl-wrap"><table>…</table></div>
<dl class="terms">…</dl>
<ol class="refs">…</ol>
```

When restyling an existing document, keep every fact, number, link and decision; change only voice, structure and design.
