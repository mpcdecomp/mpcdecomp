# mpc2000

| goal | image |
|---|---|
| `mpc2000-2k-boot` | MPC2000 boot ROM, `MPC2K_BOOT.BIN` |
| `mpc2000-2k-v150-sys`, `-exe` | MPC2000 OS v1.50, `MPC2000.SYS`, `MPC2000.EXE` |
| `mpc2000-2k-v172-sys`, `-exe` | MPC2000 OS v1.72 |
| `mpc2000-xl-v107` ... `-v120` | MPC2000XL OS v1.07, v1.10, v1.11, v1.12, v1.14, v1.20, `MPC2KXL.BIN` |

`make mpc2000-msc-check` rebuilds the SYS and XL runtime library and `c/` with
Microsoft C/C++ 8.00c and compares them with the images.  It needs podman; no
image build does.

## OPTIONS

| option | effect | targets |
|---|---|---|
| `TUNE_LIMIT=360` | `Tune:` range past the stock +/-240 | 2K v1.50/v1.72, XL but v1.10 |
| `MUTE_GROUPS=1` | mute-group choking in `MUTE ASSIGN` | 2K v1.50/v1.72, XL but v1.10 |
| `COPY_NOTE_PARAMS=1` | `PARAMS` soft key in `COPY NOTE PARAMETERS` | 2K v1.50/v1.72, XL but v1.10 |
| `ZONE_SLICE=1` | `ZONE` and `SLICE SAMPLE` on the 2K `TRIM` screen | 2K v1.50/v1.72 |
| `SKIP_DRUM_SELECT=1` | XL `PROGRAM` opens the track's drum | XL but v1.10 |

Images an option changes are skipped by the SHA256SUMS check.
XL source layout, parts and checks: [xl](xl/README.md).
[xl42k](https://github.com/mpcdecomp/xl42k) runs an `MPC2KXL.BIN` built here on a classic MPC2000.
