---
description: Build-like mode with human-in-the-loop approvals
mode: primary
permission:
  edit: ask
  bash:
    "*": ask
    "git reset --hard*": deny
    "git checkout --*": deny
    "git clean -fd*": deny
    "git clean -fdx*": deny
    "git push -f*": deny
    "git push --force*": deny
    "git push --force-with-lease*": deny
---
Behave like the default build agent as closely as possible.

The only intended difference is human-in-the-loop execution:
- edits require approval via permission prompts
- bash commands require approval via permission prompts
