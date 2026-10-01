# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# od -An -tu1 -v IMAGE | awk -f xlsum.awk -- the MPC2000XL boot loader's image
# checksum.  prints "offset stored wanted lo hi" (lo/hi octal, for printf) when
# the stored word is stale, nothing when it is right.
#
# The boot loader sums 16-bit words from flash 0 up to the checksum word and
# compares the total with it; on a mismatch it returns without copying the OS
# down, and the machine never boots.  So a feature that changes a byte below the
# word must rewrite it.  Where the word is comes from the loader's own loop, not
# from a constant here:
#   mov dl,BLOCKS / mov ax,0 / mov bx,SEG / mov es,bx / sub si,si / mov cx,8000h
#   add ax,es:[si] / add si,2 / loop / add bx,1000h / dec dl / jnz / mov es,bx
#   sub si,si / mov cx,WORDS / add ax,es:[si] / add si,2 / loop / cmp ax,es:[si]
# with the flash at 8000h:0, so the word is at SEG*16-80000h+BLOCKS*64K+WORDS*2.
# An image without that loop fails: its word could not be checked.  For a stock
# build the sum equals the stored word -- that is the test this is right.  Bytes
# are paired here rather than read as od words, so the host's byte order does
# not matter.

BEGIN {
    np = split("0:178 2:184 3:0 4:0 5:187 8:142 9:195 10:43 11:246 12:185 13:0 14:128 15:38 16:3 17:4 18:131 19:198 20:2 21:226 22:248 23:129 24:195 25:0 26:16 27:254 28:202 29:117 30:233 31:142 32:195 33:43 34:246 35:185 38:38 39:3 40:4 41:131 42:198 43:2 44:226 45:248 46:38 47:59 48:4", P, " ")
    at = -1
}
{ for (i = 1; i <= NF; i++) b[n++] = $i }
END {
    for (i = 0; i < n - 49 && at < 0; i++) {
        if (b[i] != 178) continue
        for (k = 1; k <= np; k++) { split(P[k], q, ":"); if (b[i + q[1]] != q[2]) break }
        if (k > np) at = (b[i + 6] + 256 * b[i + 7]) * 16 - 524288 + b[i + 1] * 65536 + 2 * (b[i + 36] + 256 * b[i + 37])
    }
    if (at < 0 || at + 2 > n) { print "xlsum: no checksum loop in the boot loader" > "/dev/stderr"; print "- - - - -"; exit 1 }
    for (i = 0; i < at; i += 2) s += b[i] + 256 * b[i + 1]
    s %= 65536; have = b[at] + 256 * b[at + 1]
    if (s != have) printf "%d 0x%04x 0x%04x %o %o\n", at, have, s, s % 256, int(s / 256)
}
