# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f farptr.awk image.lst -- fail on a far code pointer whose offset is a number.
#
# A far pointer into a code part is a segment the relocation table (or, on the
# XL, the part's own base) fixes up and an offset nothing does.  Written as a
# number, the offset is a second, silent reference to a byte position: grow the
# part ahead of it and the pointer lands short of its function, with the
# segment still right.  The pairings looked for are the ones the 2K SYS and the
# XL build their pointers with -- a register loaded next to a register loaded
# with the segment, an offset pushed right after the segment, a dw beside one
# (the XL's key-handler records), a callf/jmpf whose offset is a number, and an
# EP_*_OFF equate the far calls name that is a number -- read from the listing,
# so a pair split across a macro boundary is still one pair.  A code segment is
# a part's (TEXTn/CSn/Cn/APPn_SEG) or a far call's EP_*_SEG; a zero offset is a
# null pointer.

function num(x) { return x ~ /^[0-9][0-9a-fA-F]*[hH]?$/ }
function zero(x) { return x ~ /^0+[hH]?$/ }
function seg(x) { return x ~ /^(CS[0-9]|TEXT[0-9]|C[0-9]|APP[0-9]|EP_[A-Za-z0-9_]+)_SEG$/ }
function bad(k) { printf "%s:%d: far code pointer offset is a number: %s\n", FILENAME, W[k], I[k]; rc = 1 }

/ : =[0-9A-F]+H? +EP_[A-Za-z0-9_]+_OFF +equ +[0-9]/ {
    s = $0; sub(/.* : =[0-9A-F]+H? +/, "", s); sub(/[ \t]*;.*/, "", s)
    printf "%s:%d: far code pointer offset is a number: %s\n", FILENAME, FNR, s; rc = 1
    next
}
/ : +[A-Za-z_][A-Za-z0-9_]*:/ { n++; I[n] = ""; W[n] = FNR; next }    # a label parts a pair: a branch lands between the loads
/ : [0-9A-F][0-9A-F] / {
    s = substr($0, index($0, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s)
    n++; I[n] = s; W[n] = FNR
}
END {
    for (i = 1; i <= n; i++) {
        if (I[i] ~ /^(callf|jmpf)[ \t]+[^[ \t]+[ \t]*:[ \t]*[0-9][0-9a-fA-F]*[hH]?$/) { v = I[i]; sub(/.*:[ \t]*/, "", v); if (!zero(v)) bad(i); continue }
        na = split(I[i], a, /[ \t,]+/)
        if (!seg(a[na]) && a[1] != "dw") continue
        if (a[1] == "dw") {
            v = I[i]; sub(/^dw[ \t]+/, "", v); split(v, d, /[ \t]*,[ \t]*/)
            for (k = 2; k in d; k++) if (seg(d[k]) && num(d[k-1]) && !zero(d[k-1])) { bad(i); break }
            continue
        }
        if (I[i] ~ /^(callf|jmpf)/) continue
        if (a[1] == "push") { split(I[i+1], b, /[ \t]+/); if (b[1] == "push" && num(b[2]) && !zero(b[2])) bad(i+1); continue }
        for (j = i-1; j <= i+1; j += 2) {
            if (!(j in I)) continue
            split(I[j], b, /[ \t]*,[ \t]*/); split(b[1], c, /[ \t]+/)
            if (c[1] == "mov" && num(b[2]) && !zero(b[2])) bad(j)
        }
    }
    if (rc) print "farptr: name the offset (a label)"
    exit rc
}
