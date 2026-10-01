# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f relocseg.awk image.lst -- fail on a relocated word written as a number.
#
# Every word the MZ table names is a segment the loader fixes up, so it is half
# of a far pointer.  Spelt as a number (`mov dx, 0` beside `mov bx, 1e0ch`) the
# segment is right only because TEXT1_SEG happens to be 0, and it hides the
# offset beside it from farptr.awk, which pairs by segment name.  This finds
# each entry's word in the listing, by the header's own RELOC lines and the
# parts' bases, and wants a segment named on the line that emits it.

function hex(t,   i, n) { n = 0; t = tolower(t); for (i = 1; i <= length(t); i++) n = n * 16 + index("0123456789abcdef", substr(t, i, 1)) - 1; return n }

/^\(1\).* include "(header\.asm|text1\.asm|text2\.asm|data\.asm)"/ {
    part = $0; sub(/.*include "/, "", part); sub(/\..*/, "", part); next
}
/^\([0-9]+\) *[0-9]+\/ *[0-9A-F]+ : =[0-9A-F]+H? +(TEXT2_SEG|DATA_SEG) +equ/ {
    v = $0; sub(/.* : =/, "", v); sub(/H? .*/, "", v); n = $0; sub(/.* : =[0-9A-F]+H? +/, "", n); sub(/ .*/, "", n)
    base[n == "TEXT2_SEG" ? "text2" : "data"] = hex(v) * 16
}
/ : [0-9A-F][0-9A-F] / {
    a = $0; sub(/ : .*/, "", a); sub(/.*[\/ ]/, "", a)
    b = substr($0, index($0, " : ") + 3); s = b
    sub(/[ \t]*[^0-9A-F ].*/, "", b); nb = split(b, by, / /)
    if (substr($0, 1, 1) == "(") { sub(/^([0-9A-F][0-9A-F] )+ */, "", s); src = s }
    if (part == "header" && src ~ /^dw[ \t].*_SEG/ && nb == 4) {
        nr++; R[nr] = hex(by[4] by[3]) * 16 + hex(by[2] by[1])
        next
    }
    if (part == "text1" || part == "text2" || part == "data") {
        l = hex(a) + base[part]
        for (k = 1; k <= nb; k++) { L[l + k - 1] = src; F[l + k - 1] = FNR }
    }
}
END {
    for (i = 1; i <= nr; i++) {
        s = L[R[i]]; sub(/[ \t]*;.*/, "", s); gsub(/\[[^]]*\]/, "", s)
        if (s !~ /(SEG|ZS_T[12]S|ZS_DS)([^A-Za-z0-9_]|$)/) { printf "%s:%d: relocated word is a number: %s\n", FILENAME, F[R[i]], L[R[i]]; rc = 1 }
    }
    if (rc) print "relocseg: name the segment (TEXT1_SEG, TEXT2_SEG, DATA_SEG)"
    exit rc
}
