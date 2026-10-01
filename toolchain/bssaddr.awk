# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# awk -f bssaddr.awk image.lst -- fail on a 2K EXE DATA address written as a number.
#
# Every DATA name is a label or an offset from one, so anything the data gains
# ahead of an object moves it; a number stays put and lands on whatever slid
# under it.  Looked for: a DS memory operand whose displacement is such a
# number, with a base register or not (bp, or an override other than ds:,
# means another segment) -- in the BSS, BSS_START to DATA_END, or in the
# initialized data below it; there, with a base register, only from 100h up,
# since under that a displacement is a struct field.  And the bytecode
# operands that are DS addresses: BC_STATUS_A's, BC_OP_2E's and
# BC_16_LEVELS_6's index and table, BC_TIME's string, BC_WAIT's bitmap.  An
# immediate is not looked at: too many are constants, and the early-data pad
# run is what finds those.  The disk drivers run with DS=F000, whose words
# share the range; they are named too, off BUF_DISK_SECTOR or HD_HDR_BUF.  A
# hit inside code that reads as nonsense is usually data or a string decoded
# as instructions.

function hexv(t,   i, n) { n = 0; t = tolower(t); for (i = 1; i <= length(t); i++) n = n * 16 + index("0123456789abcdef", substr(t, i, 1)) - 1; return n }
function val(t) { t = tolower(t); return t ~ /h$/ ? hexv(substr(t, 1, length(t) - 1)) : t + 0 }
function isnum(t) { return t ~ /^[0-9][0-9a-fA-F]*[hH]?$/ }

/ : +\(MACRO(-[0-9]+)?\)\[[0-9]+\] +BC_(STATUS_A|OP_2E|TIME|WAIT|16_LEVELS_6) / {
    s = $0; sub(/.*\(MACRO(-[0-9]+)?\)\[[0-9]+\] +/, "", s); sub(/[ \t]*;.*/, "", s)
    op = s; sub(/[ \t].*/, "", op); a = s; sub(/^[A-Z_0-9]+[ \t]+/, "", a)
    na = split(a, A, /[ \t]*,[ \t]*/)
    for (j = 3; j <= na; j++) if (isnum(A[j]) && (j == 3 || op ~ /STATUS_A|OP_2E|16_LEVELS/)) { v = val(A[j]); if (v >= 32) { k++; V[k] = v; B[k] = 0; S[k] = s; L[k] = FNR } }
    next
}
/ : [0-9A-F][0-9A-F] / {
    s = $0; sub(/.* : ([0-9A-F][0-9A-F] )+ */, "", s); sub(/[ \t]*;.*/, "", s)
    if (s ~ /^(db|dw|dd)[ \t]/) next
    n = -1
    if (match(s, /\[[^]]*\]/)) {
        m = substr(s, RSTART + 1, RLENGTH - 2); pre = substr(s, 1, RSTART - 1)
        r = m; gsub(/(bx|si|di)/, "", r); q = r; gsub(/[0-9][0-9a-fA-F]*h?/, "", q)
        if (pre !~ /(es|cs|ss):$/ && m !~ /bp/ && q !~ /[A-Za-z_]/ && match(r, /[+-]?[ \t]*[0-9][0-9a-fA-F]*h?/)) {
            t = substr(r, RSTART, RLENGTH); neg = t ~ /^-/; gsub(/[+ \t-]/, "", t)
            n = val(t); if (neg) n = 65536 - n
        }
    }
    if (n >= 0) { k++; V[k] = n; B[k] = m ~ /(bx|si|di)/; S[k] = s; L[k] = FNR }
    next
}
/[ *]BSS_START : / { v = $0; sub(/.*BSS_START : */, "", v); sub(/ .*/, "", v); lo = hexv(v) }
/[ *]DATA_END : / { v = $0; sub(/.*DATA_END : */, "", v); sub(/ .*/, "", v); hi = hexv(v) }
END {
    if (!hi) { print FILENAME ": bssaddr: no BSS_START/DATA_END in the symbol table"; exit 1 }
    for (i = 1; i <= k; i++) {
        if (V[i] >= lo && V[i] < hi) { printf "%s:%d: BSS address is a number: %s\n", FILENAME, L[i], S[i]; rc = 1 }
        else if (V[i] < lo && V[i] >= (B[i] ? 256 : 0)) { printf "%s:%d: DATA address is a number: %s\n", FILENAME, L[i], S[i]; rc = 1 }
    }
    if (rc) print "bssaddr: name the address (a label at its byte in data.asm, or BUF_DISK_SECTOR+n / HD_HDR_BUF+n in the drivers)"
    exit rc
}
