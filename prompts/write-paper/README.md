# write-paper (README)

This prompt guides an AI agent through writing a research paper for a specific target conference. It works from whatever source material you have:

- A complete LaTeX manuscript prepared for another conference (zip or source tree)
- Loose LaTeX files, possibly incomplete
- A draft in Markdown, Word, plain text, or PDF
- A structured outline or extended notes containing the technical content and results

You also provide the target conference's call-for-papers (or author guidelines) and its LaTeX template.

The goal is not a blind format conversion. The agent must first determine the page limit from the call-for-papers or author guidance, understand the target venue, study recent strong papers from that venue, then write the manuscript into the target template with clean section files, BibTeX, citations, and a final review pass.

---

## What this is for

Use this prompt when you want an AI agent to:

- Determine the page limit from the CFP or author guidelines before planning, and enforce it throughout (an explicit `PAGE_LIMIT_OVERRIDE` setting is available if you need to override the CFP)
- Read the source material and identify its technical contribution, evidence, and narrative
- Read the target conference call-for-papers and formatting requirements
- Find three strong target-conference papers from the past five years, preferably from arXiv or author-uploaded versions
- Infer target-venue expectations for framing, contribution style, evaluation, baselines, and paper organization
- Write the paper into the target conference template
- Ensure every figure and table is referenced in the body text via `\ref`/`\Cref` and discussed with at least one takeaway sentence (a cross-reference audit table is part of the output)
- Put each major section in a separate `.tex` file and include those files from `main.tex`
- Prepare or update the `.bib` file and citation keys
- Create placeholders for any needed new figures and explicitly tell the user what to replace
- Run the `brutal-review` prompt on the finished draft and address its concerns

---

## What this is not for

This prompt should not invent new experiments, results, citations, claims, or figures. Even when starting from an outline or rough draft, every claim, number, and result in the paper must trace back to the source material. If the target venue appears to require missing evidence, the agent should flag the gap and propose text that honestly qualifies the contribution.

It also should not ignore the target template. The output should be a compilable LaTeX project that follows the target conference's structure and style files.

---

## Expected inputs

- `SOURCE_MATERIAL`: LaTeX zip/tree, loose LaTeX files, a non-LaTeX draft, or an outline with results
- `TARGET_CFP`: call-for-papers, author guidelines, review criteria, or venue page (this is where the page limit comes from)
- `TARGET_TEMPLATE`: LaTeX template for the target conference
- Optional: `PAGE_LIMIT_OVERRIDE`, anonymization requirements, deadline, must-preserve wording, author-provided related-work notes, figure source files, or forbidden claims

If a required input is missing, the agent should proceed as far as possible and list the missing item as a blocker. If no page limit can be found in any input, the agent must ask rather than guess.

---

## Repository layout

- `README.md` — this file
- `write-paper.prompt` — the prompt definition

---

## Practical tips

- Give the agent permission to browse the web for target-venue examples.
- Include the exact target year and track if available.
- Check the first row of the venue-requirements table: it must quote the CFP sentence that states the page limit and say whether references and appendices count against it.
- After the final `brutal-review` pass, manually inspect all citations, the page count, the figure/table cross-reference audit, figure placeholders, and claims that were marked `UNVERIFIED`.
