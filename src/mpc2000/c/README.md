# c/ -- the 2K SYS as C

- `match/`: functions that compile to the image's bytes with C/C++ 8.00c.
  `make mpc2000-msc-check` compiles every file here and compares each
  function in `toolchain/check.sh`'s `FN150`/`FN172` at its image offset;
  it must end rc 0 with 0 DIFFER.  `leaf.c` is the XL's.  A function
  only v1.72 has is `u<seg><addr>.c` at its v1.72 address, in `FN172`
  alone.  `x<addr>.c` is one XL v1.20 function at its flash address, in
  check.sh's `FNX`, linked with the DS names it uses (`APPX`).
- `nonmatch/`: functions that compile but do not match yet, one per file,
  `t<seg><addr>.c` at v1.50's address (`_172`: v1.72's, when only v1.72 has
  one).  Line 1 says where each version first differs.  Not in the check;
  a file here breaks no gate.  A match moves to `match/` with its check.sh
  entries.
- `draft/`: functions with no compiling C yet, same naming.  Line 1
  `/* draft: ... */` says why; an `/* asm: */` span holds the listing.

Running the check: `make ASL=... P2BIN=... TARGETS="src/mpc2000/2k/v150/sys
src/mpc2000/2k/v172/sys" MSC=2k mpc2000-msc-check` for the 2K alone (about
a minute cold), or with the six XL targets and no `MSC` for everything.
`JOBS=N` sets how many DOSBoxes compile and link at once.  Objects, links
and the library's modules are kept in `build/msc-cache`, keyed by the
source, the headers it includes, the flags and the toolchain, so a rerun
compiles and relinks only what changed (seconds); delete it to start cold.

`NOTES.md` has the compiler flags and the conventions the C follows.
