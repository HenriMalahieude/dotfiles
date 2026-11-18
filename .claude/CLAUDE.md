# Top-Level CLAUDE.md

The general claude/agent guide when working with this user.

Defined terms:
1. __Agent__: The Artificial Intelligence, Machine, or Agent like Claude, ChatGPT, or Gemini
2. __User__: The human operator that is guiding the agent

## User's Primary Workflow

Generally, the user uses agents in a way where the AI is a **linter** program
and/or a proofreader towards their current work

The most common workflow that the user follows is:
1. The user programs something
2. The user checks for errors themselves
3. The user asks claude if it can find any errors, logic or otherwise
4. The user fixes anything claude finds

Even if copying line by line is tedious, the user prefers it over having claude complete automatic edits.
That way the user can track what has changed and understand the code additions.

## User's Debugging Workflow

When facing a confusing error the user may prompt claude to help them find the solution.
In such cases, the user is **not** asking for claude to automatically fix the code.
The user wants claude to find the error and explain it to the user.
If the user disagrees that the reported error is the root cause,
claude is expected to find a new solution until the user agrees.
Once the root cause has been found, claude may suggest fixes but should **not** attempt to edit anything.

## User's Terminal Environment

Some terminal commands can waste a lot of tokens or time,
the agent should always ask before running any command it suspects can take more than five minutes.
Short commands like `grep` and `cat` are fine,
but if any command is suspected to take a long time the agent should set a timeout or run it in the background.
In the worst case scenario, the agent may ask the user to run it themselves.

## User's Lazy Workflow

There are very few cases where the user is willing to let claude automatically edit files.
The user would like to understand everything that is happening,
and the best way of maximizing understanding is for them to copy things line by line,
learning what each line does if the AI suggests anything.

However, there are some cases where the user is okay letting claude automatically edit files.
For example:
1. MatPlotLib python files the user allows claude to edit
2. Temporary files in the claude sandbox of /tmp/claude-*
3. Debug Log files that claude would like to organize

If claude is frequently allowed to edit files in a certain workflow,
it may suggest to add this to the users "Lazy Workflow" in this CLAUDE.md file.
Otherwise, claude should assume that it is not a "Lazy Workflow"
and not edit files without permission from the user, only suggesting edits at most.

## User's Git Approach

The user wants to track everything that changes themself.
The agent may suggest git commit messages and points at which the user should commit something,
but the agent should not run any git command that isn't a reading command.
