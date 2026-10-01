# mpcdecomp

Reconstructed source for Akai firmware: MPC2000/2000XL, MPC60, MPC3000, S900/S950,
S3000/S3200/S3000XL/S3200XL.

## BUILD

```
make
```

Builds the assembler, then every target, and verifies them against SHA256SUMS.
Each directory under `src/` is a goal: `make mpc2000`, `make mpc2000-xl`,
`make s9xx-s950-v12a`. Targets and options:
[mpc2000](src/mpc2000/README.md), [mpc60](src/mpc60/README.md),
[mpc3000](src/mpc3000/README.md), [s9xx](src/s9xx/README.md),
[s3000](src/s3000/README.md).

## DECOMPILE

Reconstructed C source for the three images built with a C compiler, one
branch each, kept rebased on `main` and clean:

| branch | compiler |
|---|---|
| `decompile/mpc2000` | Microsoft C/C++ 8.00c |
| `decompile/mpc3000` | Borland C++ 3.1 |
| `decompile/mpc60` | Manx Aztec C86 |

The compiler is identified by rebuilding the image's own C library from it
byte-identical. The first commit adds that toolchain (podman) and check; the
second is the application. Its C sits in `src/<platform>/c/`:
- `match/`: compiles to the image's bytes, checked in place by
  `make <platform>-<compiler>-check`;
- `nonmatch/`: compiles but differs;
- `draft/`: not compiling yet.

## LICENSE

- Firmware and everything derived from it: Akai Professional (inMusic Brands),
  all rights reserved. No license is granted.
- `toolchain/` patches to [ASL](http://john.ccac.rwth-aachen.de:8000/as/): GPL v2.
- Build tooling and option feature code: [PolyForm Noncommercial 1.0.0](LICENSE.txt).
- Files with their own notice: that notice.

For educational and preservation purposes.
