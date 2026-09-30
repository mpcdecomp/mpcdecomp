# src/mpc60/c

C for the MPC60 OS, written back for Manx Aztec C86 3.40a
(`cc +LC +F -n`, then `as -S`).  K&R; one v2.14 function per name, named
by its label in `../common`.

| dir | what | checked |
|---|---|---|
| `match/` | compiles to the image's bytes | `make mpc60-aztec-check` |
| `nonmatch/` | compiles, differs; line 1 `/* differs: ... */` | no |
| `draft/` | does not compile yet; line 1 `/* draft: ... */` | no |

`make mpc60-aztec-check` (needs podman) compiles every `match/*.c`, links
it with its data at the v2.14 DS offsets from `symbols.inc`, and compares
each function's bytes with `build/mpc60-v214/MPC60.BIN`; every line must say
"bytes match".
