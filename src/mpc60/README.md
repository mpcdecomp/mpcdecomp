# mpc60

| goal | image |
|---|---|
| `mpc60-v112` | MPC60 OS v1.12, `MPC60.BIN` |
| `mpc60-v212` | MPC60 OS v2.12 |
| `mpc60-v214` | MPC60 OS v2.14 |

`make mpc60-aztec-check` rebuilds the runtime library and `c/` with Aztec C86
3.4b and compares them with the images.  It needs podman; no image build does.
