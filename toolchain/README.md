# Patched AS (ASL)

The firmware's compiler emitted ALU direction bit d=1 (`03 D8`) where a stock
assembler picks d=0 (`01 C3`), and word-form `PUSH imm` where one picks the
byte form. AS 1.42 Build 299 with `code86.patch` applied makes the d=1 and word forms the
default and adds suffixes for the handful of sites that really are the other
way: `.d0` forces direction 0, `.l` the long `MOV` form, `.d8` a mod=01 disp8=0
memory operand, `push word` the 3-byte immediate, and `[word bx + 23h]` a
16-bit displacement where 8 bits would do -- the MPC60/MPC3000 code has these
wherever the original assembler met a table or field still undefined on its
first pass. A near `call`/`jmp` target
wraps modulo 64K as IP does, so a part assembled at org 0 can reach code of
another part that shares its CS below 0 or past FFFFh. The PC may pass FFFFh
under `phase` as long as the phased offset stays inside 64K, so an image of
several segments assembles in one run with each label its segment offset.

`perf.patch` turns on balanced (AVL) symbol and macro trees by default, as
`-A` would: unbalanced, the sorted `L_`/`RUN_`/`EP_` names degenerate the trees
into lists and a full build takes ~4 min instead of ~45 s. It also looks up a
forward label at its last-pass value plus how far the code ahead of it has
moved since, so a chain of short/near choices settles in fewer passes (7 to 5
on the largest parts), writes the listing on the last pass only, and skips the
quote-aware comment scan on a line with no `;` in it. `-lateerrors` holds an
error or warning back until a pass that is the last, so a check on a label
further on (an `if`, an `ASSERT_AT`, a `fatal`) sees its final value; without
the switch nothing changes. Output is unchanged.

```
curl -O http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/asl-current-142-bld299.tar.gz
tar xf asl-current-142-bld299.tar.gz && cd asl-current
patch -p1 < ../code86.patch && patch -p1 < ../perf.patch
cp Makefile.def-samples/Makefile.def-unknown-gcc64 Makefile.def && make
```

Then point the build at it:

```
make ASL=/path/to/asl-current/asl P2BIN=/path/to/asl-current/p2bin
```
