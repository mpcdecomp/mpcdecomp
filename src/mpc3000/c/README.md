# src/mpc3000/c

C for the MPC3000 OS, written back for Borland C++ 3.1
(`bcc -c -ml -O2 -1 -k -DFW_VERSION=nnn`; a function the image gives no frame
says `#pragma option -k-`).  One function per file, named by its label in
`../common`, or a function with its same-file callees in the image's order;
one text serves v3.08, v3.11 and v3.12.

| dir | what | checked |
|---|---|---|
| `match/` | compiles to the image's bytes in all three versions | `make mpc3000-borland-check` |
| `nonmatch/` | compiles, differs; line 1 `/* differs: ... */` | no |
| `draft/` | does not compile yet; line 1 `/* draft: ... */` | no |

`make mpc3000-borland-check` (needs podman) compiles every `match/*.c` per
version, links it with its data at each version's DS offsets from
`symbols.inc` and the far functions it calls at the image's own
segment:offset, and compares each function in check.sh's `APP` with the
image; every line must say "bytes match".

A call to a function of the same source file is `push cs / call near`
(`nop / push cs / call near` when the callee comes later), so such a caller
matches only beside its callees, in their order: such a match/ file holds
them all.  The nonmatch files that say so carry stub callees and wait for
the callees to match.

The check links all of `match/` in one TLINK run per version, so a far call
from one match/ file binds to another's copy rather than the image's: a
function another match/ file calls stays in nonmatch/ until the check links
each file on its own.
