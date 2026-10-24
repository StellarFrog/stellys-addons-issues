# Reporting a security issue

**Do not open a public issue for an exploit.**

Issues in this repository are public and permanent. An exploit posted here is a working set of
instructions for anyone reading, on every server running the addon, for as long as it takes to ship a
fix. Even a vague description is often enough for someone to reproduce it.

## What counts as an exploit

Anything that lets a player break a server rather than merely annoy one:

- duplicating money, items or rewards, or getting paid for something twice
- buying, selling or claiming at a price the server did not intend
- acting as a job, rank or staff member you do not hold
- reaching staff tools, admin panels or another player's data
- making the server hang, crash or run out of memory
- anything involving saved data belonging to other players

If you are unsure whether what you found qualifies, **treat it as one.** Reporting it privately costs
nothing, and a false alarm is far cheaper than a public disclosure.

## How to report one

**[Open a private security advisory](https://github.com/StellarFrog/stellys-addons-issues/security/advisories/new).**
Only the maintainer can read it, and you can keep talking in that thread until it is resolved.

If you would rather not use GitHub, send it as a direct message on
[Discord](https://discord.gg/cosmic-networks) instead. Say that it is a security report and nothing
else about it in public channels.

## What helps

The same things that help with any bug, plus one more: **how you found it.** Knowing whether it took
deliberate effort or happened by accident changes how urgent it is.

- which addon, and what you did
- whether it works every time
- roughly how much it is worth, if it involves money or items
- whether anyone else knows

You do not need a fix or a diagnosis. A clear description of what you did and what you got is enough.

## What happens next

You will get a reply acknowledging it. Confirmed exploits are prioritised over everything else,
including features that are already half built, because every server running the addon is exposed
until it ships.

When a fix is live, the issue is described in the changelog in terms of what changed, without
instructions for reproducing what was wrong. If you want credit by name, say so and you will get it.

**Please do not use an exploit you have found, or share it, while it is being fixed.** Reports made in
good faith are welcomed and will never be treated as an admission of wrongdoing.
