# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f segword.awk image.lst -- fail on a code address spelt as bytes or as
# the negative of a name.
#
# Two shapes, each a silent second reference to a byte position:
#   - a code segment word (dw CS0_SEG, dw APP3_SEG), anywhere in a dw, whose
#     offset half, the word emitted just before it, is not a name or zero (the
#     anchor itself), with no label between: the offset is a number, db bytes or an instruction decoded
#     across them (add byte ptr [bp+si-67e6h],bl is the 9Ah 1Ah 98h of callf
#     0FE8h:981Ah), and a grown part lands the call short.  A relocation entry
#     names where a segment word is, not a far pointer;
#   - a memory operand that subtracts a name ([bx-P_3228]): a 16-bit
#     displacement that wraps onto some other object, BUF_PANEL_EVENT_RING
#     there, which moves while the name does not.  A part's own base
#     (label-APP3_CSBASE, BASE+label-APP3_SEG*16) is not such a name: it is how
#     an offset is made.

function body(l,   s) { s = substr(l, index(l, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s); return s }
function seg(x) { return x ~ /^(CS[0-9]|TEXT[0-9]|C[0-9]|APP[0-9]|EP_[A-Za-z0-9_]+)_SEG$/ }
function zero(x) { return x ~ /^0+[hH]?$/ }
function named(x,   t) { t = x; gsub(/[0-9][0-9A-Fa-f]*[hH]?/, "", t); return t ~ /[A-Za-z_]/ }
function bad(m, s) { printf "%s:%d: %s: %s\n", FILENAME, FNR, m, s; rc = 1 }

/\(MACRO\)\[[0-9]+\][ \t]+RELOC[ \t]/ { reloc = substr($0, 1, index($0, "/")) }

/ : +[A-Za-z_][A-Za-z0-9_]*:/ { last = "label" }

/ : [0-9A-F][0-9A-F] / {
    s = body($0); if (s == "") next; t = s; gsub(/-[ \t]*[A-Za-z0-9_]*CSBASE/, "", t); gsub(/-[ \t]*[A-Za-z0-9_]+_SEG\*16/, "", t)
    if (s !~ /^(db|dw|dd)[ \t]/ && t ~ /\[[^]]*-[ \t]*[A-Za-z_][A-Za-z0-9_]*[^]]*\]/) bad("displacement subtracts a name", s)
    if (s ~ /^dw[ \t]/ && substr($0, 1, index($0, "/")) != reloc) {
        v = s; sub(/^dw[ \t]+/, "", v); n = split(v, o, /[ \t]*,[ \t]*/)
        for (i = 1; i <= n; i++) {
            p = i > 1 ? o[i - 1] : last
            if (seg(o[i]) && !named(p) && !zero(p))
                bad("far pointer offset is not a name", (i > 1 ? "" : prev " / ") s)
        }
        last = o[n]
    } else last = ""
    prev = s
}
END {
    if (rc) print "segword: name the address (a label)"
    exit rc
}
