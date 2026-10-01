# mpc2000/xl

MPC2000XL OS flash, `MPC2KXL.BIN`, 512 KB: one assembler run per version.

| goal | version | boot block |
|---|---|---|
| `mpc2000-xl-v107` | v1.07 | June 14, 1999 |
| `mpc2000-xl-v110` | v1.10 | June 14, 1999 |
| `mpc2000-xl-v111` | v1.11 | June 14, 1999 |
| `mpc2000-xl-v112` | v1.12 | June 14, 1999 |
| `mpc2000-xl-v114` | v1.14 | Feb. 15, 2001 |
| `mpc2000-xl-v120` | v1.20 | Feb. 15, 2001 |

`make mpc2000-xl` builds all six.

## TREE

| path | holds |
|---|---|
| `v1NN/image.asm` | `FW_VERSION`, the stored checksum, `BOOT_V101`; includes `common/flash/image.inc` |
| `v1NN/aliases.inc` | the equates whose value differs by version, segment anchors first |
| `v1NN/target.mk` | image name, checksum, banner, checks |
| `v120/symbols.inc` | v1.20 data addresses a feature moves |
| `common/flash/image.inc` | the parts in image order, then the anchor checks |
| `common/flash/segments.inc` | each module segment from its anchor label |
| `common/flash/public.inc` | the equates every version shares |
| `common/flash/defs.inc` | shared macros and equates |
| `common/positional.inc` | data at one anchor offset in every version |
| `common/keys.inc` | key-handler registrar macros |
| `common/structures.inc` | runs shared byte for byte, one macro each |
| `common/bootblock.asm` | the boot block, both boot ROM revisions |
| `common/feat/` | option code |

Code differing between versions sits under `if FW_VERSION`.

## PARTS

Each part is phased to 0, so its labels are offsets in the part; `PART_BASE`
is where it starts in the image. Parts name each other's labels directly.
v1.20 positions:

| part | v1.20 | contents |
|---|---|---|
| `app0` | `0x00000-0x0a9aa` | IVT, init, SCSI, panel |
| `app1` | `0x0a9aa-0x0f68c` | disk, F-ROM (`APP1_SEG`) |
| `ata` | `0x0f68c-0x0fe70` | INT 93h ATA/CF service |
| `ram` | `0x0fe70-0x1a9b6` | the `RAM_SEG` frame, entry of the INT 8Fh service |
| `app2` | `0x1a9b6-0x2310a` | INT 8Fh display service |
| `app3` | `0x2310a-0x3270e` | UI screens and keys |
| `c0` | `0x3270e-0x3dfdd` | app3's tail, then C |
| `c1` | `0x3dfdd-0x46f8e` | C |
| `c2` | `0x46f8e-0x55cd6` | C |
| `consts` | `0x55cd6-0x65cd6` | C tail, UI/DSP constant tables, erased tail |
| `free` | `0x65cd6-0x75cd6` | erased; the feature arena |
| `boot` | `0x75cd6-0x80000` | fill, checksum, boot block at `0x7c000` |

A module segment is the paragraph at its anchor label (`SEG_*` in
`aliases.inc`), so it follows the part when code ahead of it grows.
`image.inc` fails the build when an anchor moves by other than whole
paragraphs, when c1 and c2's head pass 64 KB of `C1_SEG`, or when the image is
not 512 KB.

## OPTIONS

| option | effect | versions |
|---|---|---|
| `TUNE_LIMIT=360` | `Tune:` range past the stock +/-240 | all but v1.10 |
| `MUTE_GROUPS=1` | mute-group choking in `MUTE ASSIGN` | all but v1.10 |
| `COPY_NOTE_PARAMS=1` | `PARAMS` soft key in `COPY NOTE PARAMETERS` | all but v1.10 |
| `SKIP_DRUM_SELECT=1` | `PROGRAM` opens the track's drum | all but v1.10 |
| `XL_FOR_2K=1` | the XL OS on base MPC2000 hardware | v1.20 |
| `GROWTH_PROOF=N` | N bytes of `90h` in app0, app1, ram, app3 and c2; N a multiple of 16 | all |

An image an option changes is skipped by the SHA256SUMS check. `ZONE_SLICE`
is the 2K port of XL's own feature and fails an XL build.

`GROWTH_PROOF` moves every part after each insertion point and rebuilds the
whole image around it: the anchors, far pointers, IVT and checksum follow.
The largest N that still fits: 1456 (v1.07), 1296 (v1.10, v1.11),
1248 (v1.12), 1184 (v1.14), 1008 (v1.20). Under it the `numseg` check is off,
since a number equal to a moved segment is chance.

## CHECKS

Each runs over the listing (`toolchain/*.awk`); any hit fails the build.

| check | fails on |
|---|---|
| `branch` | a near call or jump whose target is a number |
| `farptr` | a far code pointer whose offset is a number |
| `segword` | a code segment word after a numeric offset; a memory operand subtracting a name |
| `ivt` | an interrupt vector that is a number |
| `codeptr` | a near code address written as a number |
| `dbcsptr` | a `cs:` memory operand spelt as db |
| `callslot` | a number stored into a word code calls or jumps through |
| `csptr` | a DX:SI pointer into the running code segment with a numeric offset |
| `numseg` | a module segment written as a number |

`xlsum` then recomputes the boot loader's image checksum.
