# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f dsaddr.awk image.lst -- fail on a DATA-segment address written as a number.
#
# SYS runs every part with DS = DATA, so a number that means a DS address is a
# second, silent reference to a byte position in data.asm or BSS: grow either
# ahead of it and the reference lands short of its object.  Two cheap shapes
# are looked for in the listing, so a site inside a macro is still seen:
#   - a DS memory operand whose displacement is a bare number -- any absolute
#     [N] from 0Ah, and [reg+N] from 400h, past any record's field offsets
#     (lea through a base register is left alone: it takes a field's address
#     in a record ES reaches, not a DS object's);
#   - a number pushed right after the data segment, the offset half of a far
#     pointer into DS.

function hexv(t,   i, n) { n = 0; t = tolower(t); for (i = 1; i <= length(t); i++) n = n * 16 + index("0123456789abcdef", substr(t, i, 1)) - 1; return n }
function val(t) { t = tolower(t); return t ~ /h$/ ? hexv(substr(t, 1, length(t) - 1)) : t + 0 }
function bad(x) { printf "%s:%d: DS address is a number: %s\n", FILENAME, FNR, x; rc = 1 }

/ : [0-9A-F][0-9A-F] / {
    s = $0; sub(/.* : ([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s)
    if (s ~ /^(db|dw|dd)[ \t]/) { prev = s; next }
    if (match(s, /\[[^]]*\]/)) {
        m = substr(s, RSTART + 1, RLENGTH - 2); pre = substr(s, 1, RSTART - 1)
        r = m; gsub(/(bx|si|di)/, "", r); q = r; gsub(/[0-9][0-9a-fA-F]*h?/, "", q)
        if (pre !~ /(es|cs|ss):$/ && m !~ /bp/ && q !~ /[A-Za-z_]/ && match(r, /[0-9][0-9a-fA-F]*h?/)) {
            n = val(substr(r, RSTART, RLENGTH))
            if (m == r ? n >= 10 : n >= 1024 && s !~ /^lea[ \t]/) bad(s)
        }
    }
    if (prev ~ /^push[ \t]+(ds|(word[ \t]+)?DATA_SEG)$/ && s ~ /^push[ \t]+(word[ \t]+)?[0-9][0-9a-fA-F]*h?$/) bad(s)
    prev = s
}
END {
    if (rc) print "dsaddr: name the address (a data.asm label or a BSS name)"
    exit rc
}
