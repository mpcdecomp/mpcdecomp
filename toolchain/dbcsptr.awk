# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f dbcsptr.awk image.lst -- fail on a cs: memory operand spelt as db.
#
# codeptr.awk reads instructions; a line of undecoded db carries the same
# operand in its bytes, where no check sees it: 2Eh (cs:), an opcode taking a
# ModRM byte, a ModRM with a 16-bit displacement ([bx+disp16], [disp16]), and
# the displacement -- or 2Eh A0h-A3h and a moffs16.  The displacement is an
# offset in the running code segment, so growth ahead of its target leaves it
# stale with no error.  Decode the instruction and name its target instead.
# A run of db lines is read as one byte string; lines that emit nothing
# (labels, if/endif, a branch not taken) do not end it.  Not flagged: an operand that
# ends where a dw of a name takes over, or a line with a string in it (". 6"
# is 2Eh 20h 36h), which ends the run.

function flush(   i, j, op, m, n, hit) {
    if (dbline && nb) {
        for (i = 1; i <= nb; i++) {
            if (B[i] != "2E") continue
            op = B[i + 1]; m = hex(B[i + 2]); hit = 0
            if (op ~ /^A[0-3]$/ && i + 3 <= nb) hit = 1
            else if (op in OPS && (and(m, 192) == 128 || and(m, 199) == 6) && i + 4 <= nb) hit = 1
            if ((op == "8C" || op == "8E") && and(m, 32)) hit = 0   # no segment register 4-7
            if (hit) { printf "%s:%d: cs: operand inside db (2E %s %s ...): %s\n", FILENAME, at, op, B[i + 2], src; rc = 1; i += 4 }
        }
    }
    dbline = 0; nb = 0
}
function hex(x) { return index("0123456789ABCDEF", substr(x, 1, 1)) * 16 + index("0123456789ABCDEF", substr(x, 2, 1)) - 17 }
function and(a, b,   r, k) { r = 0; for (k = 1; k <= 128; k *= 2) { if (int(a / k) % 2 && int(b / k) % 2) r += k }; return r }
function take(s,   n2, a, j) { n2 = split(s, a, / /); for (j = 1; j <= n2; j++) if (a[j] ~ /^[0-9A-F][0-9A-F]$/) B[++nb] = a[j] }

BEGIN {
    split("00 01 02 03 08 09 0A 0B 10 11 12 13 18 19 1A 1B 20 21 22 23 28 29 2A 2B 30 31 32 33 38 39 3A 3B " \
          "69 6B 80 81 83 84 85 86 87 88 89 8A 8B 8C 8D 8E 8F C0 C1 C4 C5 C6 C7 D0 D1 D2 D3 F6 F7 FE FF", o, / /)
    for (k in o) OPS[o[k]] = 1
}
/^\(1\) +[0-9]+\/ *[0-9A-F]+ : +include +"[a-z0-9]+\.asm"/ { flush(); inpart = 1; next }
/^\([0-9]+\) *[0-9]+\/ *[0-9A-F]+ : / {
    s = substr($0, index($0, " : ") + 3)
    by = s; sub(/  +[^ ].*$/, "", by); body = s; sub(/^([0-9A-F][0-9A-F] )+ */, "", body)
    if (inpart && s !~ /^[0-9A-F][0-9A-F] /) next            # no bytes: a label, a skipped line
    if (!inpart || body !~ /^db[ \t]/ || body ~ /["']/) { flush(); next }
    if (!dbline) { at = FNR; src = body }
    dbline = 1; take(by); next
}
/^ +[0-9A-F]+ : ([0-9A-F][0-9A-F] ?)+ *$/ { if (dbline) { s = substr($0, index($0, " : ") + 3); take(s) }; next }
{ flush() }
END { flush(); if (rc) print "dbcsptr: decode the instruction and name its target"; exit rc }
