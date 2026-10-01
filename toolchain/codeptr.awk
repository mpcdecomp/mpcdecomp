# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f codeptr.awk image.lst -- fail on a near code address written as a
# number where the operand can only be one.
#
# The XL's parts each run under a CS their own base fixes up; a number in a
# code-relative operand is a second, silent reference to a byte position, and
# growth ahead of its target leaves it short with no error.  Two operand kinds
# are code addresses by construction, so a number there is never a constant:
#   - a cs: memory operand: its displacement is an offset in the running code
#     segment ([bx+16cdh], [bx-5f2eh]);
#   - a key/field registrar's handler (KEY_* offsets, FIELD_WHEEL/FIELD_ENTRY's
#     draw routine): the OS far-calls it in the caller's segment.
# Either one spelt as an equate whose value is a bare number (P_568D equ
# 0568dh) is the same number under a name.  Not numbers: one added to a name
# (cs:[ivt-CSBASE+24ch], a slot of the table at ivt), a register-relative
# field offset under 100h (cs:[si+2]), a zero, and in app0 -- which runs with
# CS=0 -- the live vector table below 400h (cs:[244h] is INT 91h's slot,
# placed by the CPU, not by the link).

function num(x) { return x ~ /^[0-9][0-9a-fA-F]*[hH]?$/ }
function val(x,   h, v, i) { h = x ~ /[hH]$/; sub(/[hH]$/, "", x); if (!h) return x + 0
    v = 0; for (i = 1; i <= length(x); i++) v = v * 16 + index("0123456789abcdef", tolower(substr(x, i, 1))) - 1; return v }
function lit(x) { return toupper(x) in LIT }
function body(l,   s) { s = substr(l, index(l, " : ") + 3); sub(/^([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s); return s }
function keep(kind, s) { n++; K[n] = kind; S[n] = s; P[n] = part; F[n] = FNR }

/ : =[0-9A-F]+H? +[A-Za-z_][A-Za-z0-9_]* +equ +[0-9][0-9a-fA-F]*[hH]?[ \t]*(;.*)?$/ {
    s = $0; sub(/.* : =[0-9A-F]+H? +/, "", s); split(s, a, /[ \t]+/); LIT[toupper(a[1])] = 1; next
}
/^\(1\) +[0-9]+\/ *[0-9A-F]+ : +include +"[a-z0-9]+\.asm"/ { part = $0; sub(/.*include +"/, "", part); sub(/\.asm".*/, "", part); next }
/ : \(MACRO\)\[[0-9]+\][ \t]+(KEY_|FIELD_WHEEL|FIELD_ENTRY)/ { s = $0; sub(/.*\(MACRO\)\[[0-9]+\][ \t]+/, "", s); sub(/[ \t]*;.*/, "", s); keep("reg", s); next }
/ : [0-9A-F][0-9A-F] / { s = body($0); if (tolower(s) ~ /cs:[ \t]*\[/) keep("cs", s) }

END {
    for (i = 1; i <= n; i++) {
        s = S[i]
        if (K[i] == "cs") {
            m = s; sub(/.*[cC][sS]:[ \t]*\[/, "", m); sub(/\].*/, "", m); gsub(/[ \t()]/, "", m)
            t = m; gsub(/[+-]/, " &", t); nt = split(t, a, / /); reg = 0; nv = ""; named = 0
            for (j = 1; j <= nt; j++) { x = a[j]; sub(/^[+-]/, "", x); if (x == "") continue
                if (tolower(x) ~ /^(bx|si|di|bp)$/) reg = 1
                else if (num(x)) { if (val(x)) nv = x }
                else { named = 1; split(x, b, /\*/); if (lit(b[1])) bad(i, "cs: operand is a number under a name (" b[1] ")") } }
            if (nv != "" && !named && !(reg && val(nv) < 256) && !(P[i] == "app0" && !reg && val(nv) < 1024)) bad(i, "cs: operand is a number")
            continue
        }
        split(s, w, /[ \t]+/); mac = w[1]; r = s; sub(/^[A-Za-z_0-9]+[ \t]+/, "", r); na = split(r, a, /[ \t]*,[ \t]*/)
        delete pos
        if (mac ~ /^KEY_(DOWN|UP|SHIFTED)$/) pos[2] = 1
        else if (mac ~ /^KEY_(WHEEL|DIGITS)$/) pos[1] = 1
        else if (mac ~ /^KEY_(WHEEL2|SOFT|CURSOR|LOCATE|TRANSPORT)$/) { for (j = 1; j <= na; j += 2) pos[j] = 1 }
        else if (mac ~ /^FIELD_(WHEEL|ENTRY)$/) pos[6] = 1
        for (j in pos) { x = a[j]; gsub(/[ \t()]/, "", x)
            if (num(x) && val(x)) bad(i, mac " handler is a number")
            else if (lit(x)) bad(i, mac " handler is a number under a name (" x ")") }
    }
    if (rc) print "codeptr: name the address (a label)"
    exit rc
}
function bad(i, m) { printf "%s:%d: %s: %s\n", FILENAME, F[i], m, S[i]; rc = 1 }
