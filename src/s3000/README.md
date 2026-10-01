# s3000

| goal | image |
|---|---|
| `s3000-s3000-v150` | S3000 OS v1.50, `S3000LSB.BIN` + `S3000MSB.BIN` |
| `s3000-s3000-v200` | S3000 and S3200 OS v2.0 (one image) |
| `s3000-s3200-v1` | S3200 OS v1, `S3200LSB.BIN` + `S3200MSB.BIN` |
| `s3000-s3000xl-v106` | S3000XL OS v1.06, `S3000XL.BIN` (27C040) |
| `s3000-s3000xl-v150` | S3000XL OS v1.50 |
| `s3000-s3000xl-v200` | S3000XL OS v2.0, `S30XLV20.BIN` |
| `s3000-s3200xl-v200` | S3200XL OS v2.0, `S350200.COD` |

V53 throughout.  The ROM is 256K at C0000h-FFFFFh; the reset stub copies it
to RAM 0-3FFFFh and runs it there, so its offsets are RAM addresses and
its first 400h bytes are the vector table.  S3000/S3200 take it as two 27C010
on the 16-bit bus: `LSB` even bytes, `MSB` odd.  The XL has one 27C040 with
the image in its upper half and FFh below; `S30XLV20.BIN` and `S350200.COD`
are the upper half alone (the 512K v2.0 in circulation is that plus 40000h
bytes of FFh).  The checksums on the dumps' labels (`[2900]`, `[9C79]`,
v1.06 `B9F5`) are 16-bit byte sums of each EPROM file.

`common/` is the one source for all seven, `if` on `XL`, `MODEL` and
`FW_VERSION` (set in each `image.asm`) where they differ; a number that
differs inside a shared line is an `A_` symbol, valued per image in its
`symbols.inc`.  The S3200 dump labelled V1 builds as `FW_VERSION` 100.

Names come from the boot path and the vector table: `reset` (FFFF:0),
`boot`, `ram_entry` (0:0 after the copy), `start`, `main`, `main_loop`,
`int_NN` for vector NN, `int_ignore` for a bare `iret`, and `SEG_` for the
segment holding one of them.  Other labels are `fn_`/`br_`/`far_`... by
S3000XL v2.0 address (another image's, suffixed, where v2.0 lacks it).
