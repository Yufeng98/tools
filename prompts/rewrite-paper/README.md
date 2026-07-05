# rewrite-paper (README)

This prompt guides an AI agent through converting an existing LaTeX research paper from one conference target to another. It is intended for cases where you have:

- A zipped LaTeX source tree for the current manuscript
- A call-for-papers or author instructions for the target conference
- A LaTeX template for the target conference

The goal is not a blind format conversion. The agent must first understand the target venue, study recent strong papers from that venue, then rewrite the manuscript into the target template with clean section files, BibTeX, citations, and a final review pass.

---

## What this is for

Use this prompt when you want an AI agent to:

- Read the current manuscript and identify its technical contribution, evidence, and narrative
- Read the target conference call-for-papers and formatting requirements
- Find three strong target-conference papers from the past five years, preferably from arXiv or author-uploaded versions
- Infer target-venue expectations for framing, contribution style, evaluation, baselines, and paper organization
- Rewrite the paper into the new conference template
- Put each major section in a separate `.tex` file and include those files from `main.tex`
- Prepare or update the `.bib` file and citation keys
- Create placeholders for any needed new figures and explicitly tell the user what to replace
- Run the `brutal-review` prompt on the rewritten draft and address its concerns

---

## What this is not for

This prompt should not invent new experiments, results, citations, claims, or figures. If the target venue appears to require missing evidence, the agent should flag the gap and propose text that honestly qualifies the contribution.

It also should not ignore the target template. The output should be a compilable LaTeX project that follows the target conference's structure and style files.

---

## Expected inputs

- `CURRENT_LATEX_ZIP`: zip file containing the current manuscript source
- `TARGET_CFP`: call-for-papers, author guidelines, review criteria, or venue page
- `TARGET_TEMPLATE`: LaTeX template for the new conference
- Optional: page limit, anonymization requirements, deadline, must-preserve wording, author-provided related-work notes, figure source files, or forbidden claims

If a required input is missing, the agent should proceed as far as possible and list the missing item as a blocker.

---

## Repository layout

- `README.md` — this file
- `rewrite-paper.prompt` — the prompt definition

---

## Practical tips

- Give the agent permission to browse the web for target-venue examples.
- Include the exact target year and track if available.
- After the final `brutal-review` pass, manually inspect all citations, page limits, figure placeholders, and claims that were marked `UNVERIFIED`.
