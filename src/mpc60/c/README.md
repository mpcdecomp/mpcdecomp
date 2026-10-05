# src/mpc60/c

C for the MPC60 OS, written back for Manx Aztec C86 3.4b
(`cc +LC +F -n`, then `as -S`).  K&R; one function per file, named by its
label in `../common` (leaf.c holds the first nine).

| dir | what | checked |
|---|---|---|
| `match/` | compiles to the image's bytes | `make mpc60-aztec-check` |
| `nonmatch/` | compiles, differs; line 1 `/* differs: ... */` | no |
| `draft/` | does not compile yet; line 1 `/* draft: ... */` | no |

`make mpc60-aztec-check` (needs podman) compiles every `match/*.c`, links
it with its data at each version's DS offsets from its listing and stubs
that place every far callee at the seg:off its ROM calls it by, and
compares each function's bytes with `build/mpc60-v*/MPC60.BIN`; every line
must say "bytes match".  `check.txt` lists the comparisons: a function
appears for every version whose ROM has its bytes under its name.
