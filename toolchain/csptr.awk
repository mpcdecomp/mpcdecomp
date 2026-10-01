# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f csptr.awk image.lst -- fail on a DX:SI far pointer into the running
# code segment whose offset is a number.
#
# The display calls take a string or bitmap as DX:SI; `mov dx, cs` beside
# `mov si, imm` makes SI an offset in the part's own CS, so a number there is a
# second, silent reference to a byte position and growth ahead of the target
# leaves it stale.  Flagged: `mov si, N` (BE imm16) within three instructions
# of `mov dx, cs` (8C CA) in the same part, N a nonzero number or an equate
# whose value is a bare number.  Put a label on the target and write
# label-CSBASE (or the part's BASE/SEG expression).

function num(x) { return x ~ /^[0-9][0-9a-fA-F]*[hH]?$/ }
function zero(x) { sub(/[hH]$/, "", x); return x ~ /^0+$/ }
function body(l,   s) { s = substr(l, index(l, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s); return s }
function bad(k) { if (!(k in done)) { printf "%s:%d: %s: DX:SI into CS with a numeric offset: %s\n", FILENAME, F[k], part, S[k]; rc = 1; done[k] = 1 } }

/ : =[0-9A-F]+H? +[A-Za-z_][A-Za-z0-9_]* +equ +[0-9][0-9a-fA-F]*[hH]?[ \t]*(;.*)?$/ {
    s = $0; sub(/.* : =[0-9A-F]+H? +/, "", s); split(s, a, /[ \t]+/); LIT[toupper(a[1])] = 1; next
}
/^\(1\) +[0-9]+\/ *[0-9A-F]+ : +include +"[a-z0-9]+\.asm"/ { part = $0; sub(/.*include +"/, "", part); sub(/\.asm".*/, "", part); n = 0; next }
/^\([0-9]+\) *[0-9]+\/ *[0-9A-F]+ : [0-9A-F][0-9A-F] / {
    if (!part) next
    s = substr($0, index($0, " : ") + 3); by = s; sub(/  +[^ ].*$/, "", by); b = body($0)
    if (b ~ /^db[ \t]/) next
    n++; F[n] = FNR; S[n] = b; CS[n] = (by ~ /^8C CA *$/); SI[n] = 0
    if (by ~ /^BE [0-9A-F][0-9A-F] [0-9A-F][0-9A-F] *$/ && tolower(b) ~ /^mov[ \t]+si,/) {
        x = b; sub(/^[^,]*,[ \t]*/, "", x); gsub(/[ \t()]/, "", x)
        SI[n] = (num(x) && !zero(x)) || toupper(x) in LIT
    }
    for (k = n - 3; k < n; k++) if (k >= 1) { if (CS[n] && SI[k]) bad(k); if (SI[n] && CS[k]) bad(n) }
}
END { if (rc) print "csptr: name the target (a label)"; exit rc }
