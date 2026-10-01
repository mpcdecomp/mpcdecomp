# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f callslot.awk image.lst -- fail on a number stored into a word that
# code calls or jumps through.
#
# A word some instruction calls or jumps through (FF 16/26 near, FF 1E/2E
# far: `call word ptr [w]`, `callf [w]`) holds a code offset, so every
# `mov word ptr [w], imm` into it is a code address: spelt as a number it is a
# second, silent reference to a byte position, and growth ahead of the target
# leaves it stale.  Two spellings are flagged, per part (a word's value is an
# offset in the CS of the part that calls through it):
#   - the store as an instruction whose operand is a number, or an equate
#     whose value is a bare number (P_1909 equ 1909h);
#   - the store still inside db (C7 06 w imm16), read across db lines the way
#     dbcsptr.awk reads them.
# Name the target (a label) and store label-CSBASE.  A zero is not a target.

function num(x) { return x ~ /^[0-9][0-9a-fA-F]*[hH]?$/ }
function zero(x) { sub(/[hH]$/, "", x); return x ~ /^0+$/ }
function take(s, arr,   n2, a, j) { n2 = split(s, a, / /); for (j = 1; j <= n2; j++) if (a[j] ~ /^[0-9A-F][0-9A-F]$/) arr[++arr[0]] = a[j] }
function flush(   i) {
    if (dbline)
        for (i = 1; i + 5 <= D[0]; i++)
            if (D[i] == "C7" && D[i + 1] == "06" && (D[i + 4] != "00" || D[i + 5] != "00")) {
                n++; P[n] = part; A[n] = D[i + 3] D[i + 2]; F[n] = at; S[n] = "db: " src; i += 5
            }
    dbline = 0; delete D; D[0] = 0
}
function insn(   i, x) {
    if (!I[0]) return
    if (I[0] >= 4 && I[1] == "FF" && (I[2] == "16" || I[2] == "26" || I[2] == "1E" || I[2] == "2E")) W[part, I[4] I[3]] = 1
    if (I[0] == 6 && I[1] == "C7" && I[2] == "06" && ibody ~ /^mov[ \t]+word ptr \[[^]]*\],/) {
        x = ibody; sub(/^[^,]*,[ \t]*/, "", x); sub(/[ \t]*;.*/, "", x); gsub(/[ \t()]/, "", x)
        if ((num(x) && !zero(x)) || toupper(x) in LIT) { n++; P[n] = part; A[n] = I[4] I[3]; F[n] = iat; S[n] = ibody }
    }
    delete I; I[0] = 0
}

BEGIN { D[0] = 0; I[0] = 0 }
/ : =[0-9A-F]+H? +[A-Za-z_][A-Za-z0-9_]* +equ +[0-9][0-9a-fA-F]*[hH]?[ \t]*(;.*)?$/ {
    s = $0; sub(/.* : =[0-9A-F]+H? +/, "", s); split(s, a, /[ \t]+/); LIT[toupper(a[1])] = 1; next
}
/^\(1\) +[0-9]+\/ *[0-9A-F]+ : +include +"[a-z0-9]+\.asm"/ {
    flush(); insn(); part = $0; sub(/.*include +"/, "", part); sub(/\.asm".*/, "", part); next
}
/^\([0-9]+\) *[0-9]+\/ *[0-9A-F]+ : / {
    s = substr($0, index($0, " : ") + 3)
    if (!part || s !~ /^[0-9A-F][0-9A-F] /) next             # no bytes: a label, a skipped line
    insn()
    by = s; sub(/  +[^ ].*$/, "", by); body = s; sub(/^([0-9A-F][0-9A-F] )+ */, "", body)
    if (body ~ /^db[ \t]/) { if (!dbline) { at = FNR; src = body }; dbline = 1; take(by, D); inI = 0; next }
    flush(); take(by, I); ibody = body; iat = FNR; inI = 1; next
}
/^ +[0-9A-F]+ : ([0-9A-F][0-9A-F] ?)+ *$/ {
    s = substr($0, index($0, " : ") + 3)
    if (dbline) take(s, D); else if (inI) take(s, I)
    next
}
{ flush(); insn(); inI = 0 }
END {
    flush(); insn()
    for (i = 1; i <= n; i++)
        if ((P[i], A[i]) in W) { printf "%s:%d: %s: number stored into call-through word %sh: %s\n", FILENAME, F[i], P[i], A[i], S[i]; rc = 1 }
    if (rc) print "callslot: name the target (a label) and store label-CSBASE"
    exit rc
}
