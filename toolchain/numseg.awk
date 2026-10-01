# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f numseg.awk image.lst -- fail on a module segment written as a number.
#
# A part's segment (APP3_SEG, C2_SEG, ...) follows the layout; a number equal
# to one is a second, silent copy that growth leaves pointing at the old
# paragraph.  Read: a far call or jump still in db -- 9Ah/EAh, a 16-bit
# offset, then the segment -- across consecutive db lines.  Segments below
# 100h are not read (ATA_SEG can be 0 and zero bytes are everywhere).  A value
# match is only meaningful at the stock layout: under GROWTH_PROOF the
# segments move and a match is chance, so that option skips this check.
# Write the segment name (and a label for the offset).

function hex(x,   v, i) { v = 0; for (i = 1; i <= length(x); i++) v = v * 16 + index("0123456789ABCDEF", substr(x, i, 1)) - 1; return v }
function body(l,   s) { s = substr(l, index(l, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s); return s }
function take(s,   n2, a, j) { n2 = split(s, a, / /); for (j = 1; j <= n2; j++) if (a[j] ~ /^[0-9A-F][0-9A-F]$/) { B[++nb] = a[j]; BL[nb] = at; BS[nb] = src } }
function flush(   i) {
    for (i = 1; i + 4 <= nb; i++)
        if (B[i] == "9A" || B[i] == "EA") { c++; CV[c] = hex(B[i + 4] B[i + 3]); CF[c] = BL[i]; CS[c] = part ": db " BS[i] }
    nb = 0
}

/Symbol Table \(\* = unused\)/ { flush(); insym = 1 }
insym {
    s = $0
    while (match(s, /[A-Za-z_][A-Za-z0-9_]* : +[0-9A-F]+ [^|]*\|/)) {
        t = substr(s, RSTART, RLENGTH); s = substr(s, RSTART + RLENGTH)
        split(t, a, /[ :]+/)
        if (a[1] ~ /^(RAM|APP[0-9]|ATA|C[0-9]|DS|APPDATA|CONSTS)_SEG$/ && hex(a[2]) >= 256) SEG[hex(a[2])] = a[1]
    }
    next
}
/^\(1\) +[0-9]+\/ *[0-9A-F]+ : +include +"[a-z0-9]+\.asm"/ { flush(); part = $0; sub(/.*include +"/, "", part); sub(/\.asm".*/, "", part); next }
/^\([0-9]+\) *[0-9]+\/ *[0-9A-F]+ : [0-9A-F][0-9A-F] / {
    if (!part) next
    s = substr($0, index($0, " : ") + 3); by = s; sub(/  +[^ ].*$/, "", by); b = body($0)
    if (b ~ /^db[ \t]/ && b !~ /["']/) { if (!nb) { at = FNR; src = b }; take(by); next }
    flush(); next
}
/^ +[0-9A-F]+ : ([0-9A-F][0-9A-F] ?)+ *$/ { if (nb) take(substr($0, index($0, " : ") + 3)); next }
END {
    for (i = 1; i <= c; i++) if (CV[i] in SEG) { printf "%s:%d: segment %s as a number: %s\n", FILENAME, CF[i], SEG[CV[i]], CS[i]; rc = 1 }
    if (rc) print "numseg: write the segment name"
    exit rc
}
