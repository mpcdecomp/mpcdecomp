# c/ -- the 2K SYS's C

`make mpc2000-msc-check` compiles each `match/t1*.c`/`match/t2*.c` with C/C++
8.00c and compares every function in check.sh's `FN150`/`FN172` at its image
offset.

## Build

- `cl /c /AL /G2 /Ox /Gy /Aw`, `/NT TEXT1` or `/NT TEXT2`; LINK `/f`.
- `/Gy`: each function is a COMDAT, word-aligned by LINK with a 00.  A module's
  last function, if odd, ends in CL's own 90 instead -- the image's
  `retf / db 90h` sites are module ends (171 in v1.50), less the ones that
  are a mid-function `jmp` padded to a label.
- `/f`: a far call to the same segment is `nop / push cs / call near`.
- `/Aw`: a strcpy into a stack buffer switches DS to SS around it.
- A file is one run of the image: LINK places COMDATs in object order, then
  definition order.  The C keeps the image's block order; CL does too, so a
  function written with gotos in that order compiles to the same bytes.

## Conventions

| shape in the image | C |
|---|---|
| `push ds / mov cx, DATA_SEG / mov ds, cx ... pop ds / retf` | `void __far __fastcall __loadds f(void)`, symbol `@f` -- the UI key handlers |
| argument in `ax` (`mov cx, ax` first) | `__fastcall` |
| `retf N` | `__pascal`, N/2 words; callers push left to right |
| `retf`, caller `add sp, N` | cdecl |
| `ret` / `ret N` | `__near` (a static helper) |
| `pusha / push ds / push es / mov bp, sp / push ds / mov ax, DATA_SEG / mov ds, ax / cld ... mov sp, bp / pop es / pop ds / popa / iret` | `void __interrupt __far f(void)`; `sti` is `_enable()` |
| `mov ax, si / mov dx, ss` before the return | `__pascal` returning a struct through the hidden pointer |
| `and byte ptr [bx+T], m / add bx, 2 / cmp bx, 20h / jl` | `for (i = 0; i < 32; i += 2) T[i] &= m` over a char array |

## Data

- Every DGROUP name is `extern` with its listing name.  An array needs a
  size (`char X[1]`), and a pointer into DGROUP `__near`: otherwise CL takes
  it as far and loads a segment.
- Signedness shows in the branches: `jl`/`jge` signed, `jb`/`jae` unsigned;
  `cbw` is a signed char, `sub ah, ah` an unsigned one.
- A zeroed local buffer is `memset` (intrinsic: `rep stosw` + `stosb`); an
  initializer `{0}` stores the first byte apart.
- Display lists are `#pragma pack(1)` structs, longs at odd offsets.
- Display-list callees take `int` parameters; a caller passes its own
  parameters straight from the stack.

## Control flow

- `sub ax, ax` zeroes a long, `xor ax, ax` an int: `sub ax, ax / mov [x+2], ax
  / mov [x], ax` is `x = 0L`.
- `if (c) { a } else { b }` keeps the image's order (`jcc / a / jmp / b`); the
  same code as gotos gets its blocks moved.
- A switch with a high case CL splits: `cmp ax, K / je / ja default`, the low
  cases stepped down in `al`.  Unsigned `ja` even for a signed char.
- `cmp ax, K / ja default / add ax, ax / xchg bx, ax / jmp cs:[bx+T]` is a
  switch through a table.
- `cmp al, [m]` (register first) means the value was a local; `cmp [m], al` is
  CL's own reuse of an expression.
- `push ds / mov cx, DATA_SEG` after the register saves is still `__fastcall
  __loadds`; with register arguments it is `__fastcall __loadds` with them.
- A parameter loaded into `si`/`di` at entry is the parameter itself, not a copy.
- `mov cl, al / add al, al / add al, cl / add al, al` is `x * 6`.
- A function running past its segment's last paragraph moves DGROUP in the
  check's link: leave it out (`fn_0D9CE`).
- A switch is `mov al, [x] / cbw` then `dec ax` / `sub ax, n` steps, each
  followed by `je`; a run of cases is `jl default / jo default / dec ax / jle`.
- `if (c < 5) c = 0; else c = 1;` gives `jge / xor / jmp / mov 1`; the
  ternary gives the other order.  `c ? 7 : 2` gives `cmp c, 1 / sbb / and / add`.
- `x / 2` on an int is a real `idiv` with `cx = 2`.
- A `retf` or `jmp` mid-function followed by `db 90h` is CL aligning the next
  label; each `return` inside a switch gets its own epilogue.
- Switch bodies come out in source order after the `or ax, ax / je`, `dec ax
  / je` chain: a `default:` written first is the fall-through code, and a case
  falling into the next is just source order (`change_disk_do_it`).

## Generated files

`t1XXXXX.c`/`t2XXXXX.c` (text1/text2 offset in v1.50) are one function each,
lifted from the listing as goto-C in the image's block order and kept only
where both versions compile to the image's bytes.  Globals are `char X[1]`
with casts where the code reads them at more than one width.  A one-case
`switch` is how `or ax, ax / je` comes back; CL gives the same bytes.

## Not reproduced yet

`lcd_write_data` (CL keeps `b` in memory, the image in `di`), `fn_03836`
(CL folds `(x + 1) * 2` into the displacement), `draw_signed_value`,
`ui_row_request`, `mem_op_wrapper_3`, `L_0D272` (15 bytes, no pad, a function
after it: CL's 90 cannot match).
