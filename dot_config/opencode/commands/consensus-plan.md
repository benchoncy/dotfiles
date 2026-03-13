---
description: Build a consensus plan through iterative peer review
agent: plan
---
Produce an implementation-ready plan by iterating between the `plan` agent and the `peer-review` agent until the result is robust and converged.

If the user supplied extra input, incorporate it:
$ARGUMENTS

Workflow:
1. Draft an initial plan from the current conversation context.
2. Run a review round with the `peer-review` agent to challenge assumptions, identify gaps, and surface tradeoffs.
3. Revise the plan to address feedback and explicitly note what was resolved.
4. Repeat steps 2-3 until convergence or the round cap is reached.

Round cap:
- Maximum 6 review rounds.

Convergence criteria (stop when any condition is true):
- The `peer-review` agent explicitly indicates convergence.
- No new high-priority concerns appear for 2 consecutive rounds.
- The process reaches 6 rounds.

Rules:
- Use the `peer-review` agent each round; do not rely on self-critique alone.
- Prioritize high-impact risks and sequencing problems first.
- Avoid repeating resolved points; carry forward only open concerns.
- If unknowns remain, provide best-effort defaults and list targeted follow-up questions.

Output format:
1. Goal
2. Decisions taken
3. Ordered action plan
4. Risks and mitigations
5. Verification checklist
6. Consensus summary (rounds used and why the loop stopped)
7. Open questions (if any)

Keep the final plan concise, concrete, and executable.
