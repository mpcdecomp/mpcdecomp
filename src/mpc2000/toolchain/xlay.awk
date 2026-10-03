# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# One XL x file's link layout, as omf.awk records.  Input: a line "frame
# offset end" (hex frame, decimal offset and end) for the function, then
# "name frame offset" (hex) for each code name it calls.  Output: empty
# segments up to the function's frame, segment XTEXT there with a fill
# COMDAT to the function's offset, empty segments up to DS_SEG (582B0h);
# a callee in the function's frame is a public of XTEXT, one elsewhere a
# public of an empty segment started at its frame, so LINK writes the
# flash's own frame:offset for it.
function seg(len, cls) { printf "SEGDEF 20 %X 6 %X\n", len, cls; return ++ns }
function span(a, b, cls,  p, q, k, i, n, pts) {
	n = 0; pts[++n] = a
	for (k in fr) if (fr[k] * 16 > a && fr[k] * 16 < b) pts[++n] = fr[k] * 16
	pts[++n] = b
	for (i = 2; i <= n; i++) for (k = i; k > 1 && pts[k] < pts[k - 1]; k--) { t = pts[k]; pts[k] = pts[k - 1]; pts[k - 1] = t }
	for (i = 1; i < n; i++) {
		p = pts[i]; q = pts[i + 1]
		if (p == q) continue
		first = 1
		while (p < q) {
			l = q - p; if (l > 65535) l = 65535; if (!first && l > 32768) l = 32768
			s = seg(l, cls)
			if (first && p % 16 == 0) at[p / 16] = s
			first = 0; p += l
		}
	}
}
function hex(s,  i, v) { v = 0; s = toupper(s)
	for (i = 1; i <= length(s); i++) v = v * 16 + index("0123456789ABCDEF", substr(s, i, 1)) - 1
	return v }
NR == 1 { F = hex($1); o = $2; end = $3; next }
{ nm[NR] = $1; fr[NR] = hex($2); of[NR] = $3 }
END {
	print "THEADR XLAY"; print "LNAMES - XTEXT CODE FILL FILL2 F XFILL"
	ns = 0; span(0, F * 16, 4)
	print "SEGDEF 68 0 2 3"; xs = ++ns
	span(end, 361136, 5)
	if (o > 0) printf "COMDAT %X 7 %X\n", xs, o
	for (k in nm) {
		s = fr[k] == F ? xs : at[fr[k]]
		up = toupper(nm[k])
		for (d = 1; d <= 3; d++) {
			n = d == 1 ? "_" nm[k] : d == 2 ? up : "@" nm[k]
			if (s) printf "PUB 0 %X %s %s\n", s, n, of[k]
			else printf "ABS %X %s %s\n", fr[k], n, of[k]
		}
	}
	print "MODEND"
}
