---
description: Create a draft GitHub PR with contextual description
agent: build
---
Create a GitHub pull request in draft state first, with a strong PR description generated from repository context.

Hard requirements:
- Always create as draft using `gh pr create --draft`.
- Use `gh` for GitHub operations.
- Use an available repository PR template when one exists.
- If no template is found, use this exact fallback template:

## Description 📝 (What?)
<!-- description of the change in detail -->


## Motivation and Context 🤔 (Why?)
<!--- Why is this change required? What problem does it solve? -->


Related: <!-- Links to tickets, issues, or other relevant info -->

## Checklist 📋
- [ ]

Workflow:
1. Validate prerequisites:
   - Confirm we are in a git repository and on a branch.
   - Confirm `gh auth status` succeeds.
2. Determine base and head:
   - `head` is current branch.
   - Use `branch.<head>.gh-merge-base` if configured.
   - Otherwise use the repo default branch from `gh repo view --json defaultBranchRef`.
3. Gather context for title/body:
   - Commits from `base...HEAD`.
   - Diff summary and changed files.
   - Detect referenced issue IDs from branch name, commit messages, or user-provided context.
4. Discover PR templates in supported locations, checking both root and `.github` variants:
   - `pull_request_template.md`
   - `docs/pull_request_template.md`
   - `.github/pull_request_template.md`
   - `PULL_REQUEST_TEMPLATE/*.md`
   - `docs/PULL_REQUEST_TEMPLATE/*.md`
   - `.github/PULL_REQUEST_TEMPLATE/*.md`
5. Choose template behavior:
   - If exactly one template is found, use it.
   - If multiple templates are found, ask the user to choose one (numbered list).
   - If none are found, use the fallback template exactly as provided above.
6. Build PR body:
   - Keep template section headings intact.
   - Replace placeholder comments with concrete context from commits and diff.
   - Keep `Related:` line and include links/IDs when known.
   - Keep checklist format and pre-check only items that are clearly complete.
7. Ask the user only when critical information is missing (for example, unclear motivation, missing issue/ticket reference, or template choice). Ask concise, targeted questions.
8. Before create:
   - Ensure the branch is pushed and has an upstream; if needed, push with `git push -u origin <head>`.
   - Check for an existing PR from this head branch. If one exists, do not create a duplicate; show URL and ask whether to update it with `gh pr edit`.
9. Create PR with explicit fields and draft flag:
   - Use `--title`, `--body-file`, `--base`, `--head`, and `--draft`.
10. Final response must include:
   - PR URL.
   - Which template was used (or that fallback was used).
   - What was auto-filled vs what came from user input.

Do not open as ready for review in this command.
