# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# An MPC2000 SYS build's listing (image.lst) to the names check.sh links C
# against:  "1 OFF name" and "2 OFF name" for each text1 and text2 label, at
# its offset in the segment; "D OFF NAME" for every other symbol a 16-bit value
# can stand for, as a DATA offset; "S NAME VALUE" for TEXT2_SEG and DATA_SEG.
# The segment is the n-th top-level phase; a label in a macro is left out.
{ sub(/\r$/, "") }
/^\(1\) *[0-9]+\/ *[0-9A-F]+ : +phase +0/ { seg = ++np; on = 1; d = 0; next }
/^\(1\) *[0-9]+\/ *[0-9A-F]+ : +(dephase|phase)/ { seg = 0; next }
/^\([0-9]\) *[0-9]+\/ *[0-9A-F]+ : =[0-9A-F]+H +(TEXT2_SEG|DATA_SEG) +equ/ {
	v = $0; sub(/.* : =/, "", v); split(v, a, /H +/); split(a[2], b, / /)
	if (!(b[1] in s)) { s[b[1]] = 1; print "S", b[1], a[1] }
}
/Symbol Table \(/ { tab = 1; next }
tab {
	n = split($0, e, /\|/)
	for (i = 1; i <= n; i++) {
		if (e[i] !~ / : /) continue
		split(e[i], f, / : /); nm = f[1]; gsub(/[ *]/, "", nm)
		m = split(f[2], g, / +/); val = ""
		for (j = 1; j <= m; j++) if (g[j] != "") { val = g[j]; break }
		sub(/^0+/, "", val); if (val == "") val = "0"
		if (val !~ /^[0-9A-F]+$/ || length(val) > 4 || (nm in code)) continue
		print "D", val, nm
	}
	next
}
seg == 1 || seg == 2 {
	if (!match($0, /^\([0-9]\) *[0-9]+\/ *[0-9A-F]+ : /)) next
	h = substr($0, 1, RLENGTH); src = substr($0, RLENGTH + 25)
	mk = substr($0, RLENGTH + 1, 24); sub(/ +$/, "", mk); t = src; sub(/^[ \t]+/, "", t); split(t, op, /[ \t]+/)
	# the listing shows an assembly-time conditional's skipped arm too
	if (op[1] ~ /^if/) { up[++d] = on; on = on && (mk == "=>TRUE" || op[1] == "ifdef" && mk == "=>DEFINED" || op[1] == "ifndef" && mk == "=>UNDEFINED"); next }
	if (op[1] == "else" || op[1] == "elseif") { on = up[d] && mk == "=>TRUE"; next }
	if (op[1] == "endif") { on = up[d--]; next }
	if (!on) next
	if (substr($0, RLENGTH + 1, 7) == "(MACRO)") next
	# NAME equ $: a version's own name for a code label
	if (src ~ /^[A-Za-z_][A-Za-z0-9_]*[ \t]+equ[ \t]+\$/ && mk ~ /^=[0-9A-F]+H/) {
		split(src, q, /[ \t]+/); v = substr(mk, 2); sub(/H.*/, "", v); sub(/^0+/, "", v)
		code[toupper(q[1])] = 1; print seg, v, q[1]; next
	}
	if (!match(src, /^[A-Za-z_][A-Za-z0-9_]*:/)) next
	nm = substr(src, 1, RLENGTH - 1)
	sub(/ : $/, "", h); sub(/.*\/ */, "", h)
	code[toupper(nm)] = 1
	print seg, h, nm
}
