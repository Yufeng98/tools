# Brutal Presentation Reviewer (README)

This prompt is a **near-delivery quality gate** for technical presentations. It is designed for the last few hours (or last day) before a deadline, when you need **high-signal triage**: what must be fixed to avoid audience confusion or credibility loss, vs what can be polished if time remains.

This workflow performs best when the model’s **thinking mode** is enabled (for example, **Extended Thinking** in ChatGPT or **Pro** mode in Gemini), especially for logic, cognitive load, and visual-verbal alignment passes.

---

## What this is for

Use this prompt when you have a **near-final draft** of your deck and script and want a structured review that covers:

- Cognitive load reduction (identifying overloaded slides and walls of text)
- Visual-verbal alignment (checking if speaker notes complement rather than just read the slide)
- Narrative flow and transitions (finding abrupt jumps or missing bridges)
- Fact and clarity checking (ensuring technical concepts are digestible for the target audience)
- Consistency checking (terminology, acronyms, and visual metaphors)
- Audience traps (identifying where a distracted or skeptical audience will tune out)

This is not a substitute for presenter judgment. It compresses the time required for a thorough pass and reduces “silent” errors that are easy to miss when tired.

---

## Why it works (prompt-as-procedure)

This prompt is written as a **procedure**, not a casual request. That matters because technical presenting is:

- **High-stakes**: a single overloaded slide, confusing chart, or broken transition can lose the room entirely.
- **Adversarial**: audiences have short attention spans and will easily get distracted if the cognitive burden is too high.
- **Audit-heavy**: you need issues tied to specific slides and notes, not vague suggestions to "make it more engaging."

The procedure format forces:
- **Repeatability** (same structure every run)
- **Triage** (IMPORTANT vs SUGGESTED)
- **Traceability** (locations + specific elements)
- **Guardrails** (no invented visuals, strict adherence to time constraints)

---

## What you get (deliverables)

The output is intentionally shaped like a “submission war-room” checklist:

1. **IMPORTANT CHANGES**
   Must-fix issues that affect audience comprehension, flow, or credibility.

2. **SUGGESTED CHANGES**
   Polish, pacing, and engagement enhancements.

3. **CONSISTENCY REPORT (table)**
   Canonical terminology/visuals + where inconsistencies appear.

4. **COGNITIVE LOAD & ALIGNMENT AUDIT (table)**
   Slide-by-slide flags for overloaded text or disconnected speaker notes.

5. **FINAL “AUDIENCE COP” SUMMARY**
   Top tune-out moments, weak transitions, and slide-script redundancies.

---

## When to use it

### Best time
- Final 2–24 hours before presentation delivery
- After major structuring is done
- When you want to lock flow and clarity

### Best inputs
- Full presentation slide text + Speaker notes (preferred)
- Descriptions of key figures/diagrams
- Venue and audience constraints (time limits, technical depth)
- Style constraints (for example, "executive summary style")

---

## What it does not do

This workflow is designed to avoid two failure modes: “rewrite everything” and “invent content”.

It will not (and should not be used to):
- Rewrite the entire presentation end-to-end
- Add new claims, technical results, or data
- Fabricate visuals or assume graphics that aren't described
- Guess missing context (it should ask for visual descriptions if needed)

---

## How to run it

1. Open the prompt definition in **`brutal-presentation-review.prompt`**.
2. Paste your slides and notes into the prompt’s **BEGIN REVIEW** area.
3. If you have them, also paste:
   - text descriptions of complex diagrams
   - audience and time constraints
4. Apply fixes in this order:
   1) IMPORTANT (High confidence)
   2) IMPORTANT (Medium/Low confidence; verify)
   3) SUGGESTED as time allows

---

## Repository layout

- `README.md` — this file
- `brutal-presentation-review.prompt` — the prompt definition (copy/paste into your LLM tool)

---

## Practical tips (from repeated use)

- Always include speaker notes: the AI's ability to spot redundancies between what the audience reads and what they hear is its most valuable feature.
- Treat visual placeholders seriously: if you have a complex chart, briefly describe it in brackets (e.g., `[Visual: Bar chart showing Q3 revenue doubling]`) so the AI can evaluate the cognitive load.
- Run it twice: once on the full deck, once specifically focusing on your **intro + conclusion** where stakes are highest.
- Never accept invented data: if it suggests adding a metric to strengthen a point, you must supply/verify it.

---

## Recommended variations

- **Short pass (time-crunched):** run on title slide + agenda + conclusion.
- **Audience-specific:** add constraints like "assume the audience is non-technical C-suite executives."
- **Lab policy:** add a rule limiting sensitive inputs (partner data, embargoed results).

