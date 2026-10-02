# mpc3000

| goal | image |
|---|---|
| `mpc3000-v308` | MPC3000 OS v3.08, `MPC3000.BIN` |
| `mpc3000-v311` | MPC3000 OS v3.11 |
| `mpc3000-v312` | MPC3000 OS v3.12 |

`make mpc3000-borland-check` rebuilds the runtime library and `c/match` with Borland
C++ 3.1 and compares them with the images.  It needs podman; no image build does.
