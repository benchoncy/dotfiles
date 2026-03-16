---
description: Build a consensus plan through iterative peer review
agent: plan
---
Load and use the `consensus-planning` skill.

If the user supplied extra input, incorporate it:
$ARGUMENTS

Use current conversation context as the source material and execute the skill's full review loop with `peer-review` until convergence criteria are met.

Return the final result in the skill's output format.
