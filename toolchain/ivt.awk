# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f ivt.awk image.lst -- fail on an interrupt vector that is a number.
#
# An image that carries its own IVT (the 1024 bytes from TBL_IVT) points each
# vector at a handler somewhere in the image.  A vector spelt as bytes, or as
# dw 9751h, 0, stays where the handler was when a part ahead of it grows; each
# wants dw label, SEG.  A zero segment is the flat CS=0 frame, not a number.

function body(l,   s) { s = substr(l, index(l, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s); return s }
function addr(l,   a) { a = substr(l, index(l, "/") + 1); sub(/ : .*/, "", a); gsub(/ /, "", a); return a }
function hex(x,   i, n) { n = 0; x = toupper(x); for (i = 1; i <= length(x); i++) n = n * 16 + index("0123456789ABCDEF", substr(x, i, 1)) - 1; return n }
function zero(x) { return x ~ /^0+[hH]?$/ }
function named(x,   t) { t = x; gsub(/[0-9][0-9A-Fa-f]*[hH]?/, "", t); return t ~ /[A-Za-z_]/ }
function bad(m, s) { printf "%s:%d: %s: %s\n", FILENAME, FNR, m, s; rc = 1 }

/ : +TBL_IVT:/ { start = hex(addr($0)); on = 1; next }

on && / : [0-9A-F][0-9A-F] / {
    if (hex(addr($0)) >= start + 1024) { on = 0; next }
    s = body($0)
    if (s !~ /^dw[ \t]/) { bad("vector spelt as bytes", s); next }
    v = s; sub(/^dw[ \t]+/, "", v); n = split(v, o, /[ \t]*,[ \t]*/)
    for (i = 1; i <= n; i++)
        if (i % 2 ? !named(o[i]) : !named(o[i]) && !zero(o[i]))
            bad(i % 2 ? "vector offset is a number" : "vector segment is a number", s)
}
END {
    if (rc) print "ivt: name the handler (dw label, SEG)"
    exit rc
}
