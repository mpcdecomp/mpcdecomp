# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# Writes an OMF object from one line a record:
#   THEADR name | LNAMES name... ("-" is the empty name) | MODEND
#   SEGDEF acbp len name# class# | GRPDEF name# seg#
#   PUB group# seg# name off   (runs of these share PUBDEF records)
#   ABS frame name off         (a public at an absolute frame:offset)
#   COMDAT seg# name# len      (explicitly allocated to seg#, byte aligned, zeros)
#   FILE path                  (what follows goes to path, not standard output)
# with numbers in hex and a zero checksum, which LINK takes as none.  A record
# is built in b[] and printed a byte at a time: awk's strings cannot hold a 0.
function x(s,  i, v) { v = 0; s = toupper(s)
	for (i = 1; i <= length(s); i++) v = v * 16 + index("0123456789ABCDEF", substr(s, i, 1)) - 1
	return v }
function h(v) { b[++nb] = v % 256 }
function w(v) { h(v % 256); h(int(v / 256)) }
function nm(s,  i) { h(length(s)); for (i = 1; i <= length(s); i++) h(index(A, substr(s, i, 1)) + 31) }
function p(c) { if (fo == "") printf "%c", c; else printf "%c", c > fo }
function out(t,  i) { p(t); n = nb + 1; p(n % 256); p(int(n / 256))
	for (i = 1; i <= nb; i++) p(b[i])
	p(0); nb = 0 }
function flush() { if (np) out(144); np = 0 }
BEGIN { A = ""; for (i = 32; i < 127; i++) A = A sprintf("%c", i) }
$1 != "PUB" { flush() }
$1 == "FILE" { if (fo != "") close(fo); fo = $2 }
$1 == "THEADR" { nm($2); out(128) }
$1 == "LNAMES" { for (i = 2; i <= NF; i++) nm($i == "-" ? "" : $i); out(150) }
$1 == "SEGDEF" { h(x($2)); w(x($3)); h(x($4)); h(x($5)); h(1); out(152) }
$1 == "GRPDEF" { h(x($2)); h(255); h(x($3)); out(154) }
$1 == "PUB" {
	k = $2 " " $3
	if (k != pk || nb > 900) flush()
	if (!np) { h(x($2)); h(x($3)) }
	pk = k; np = 1; nm($4); w(x($5)); h(0)
}
$1 == "ABS" { h(0); h(0); w(x($2)); nm($3); w(x($4)); h(0); out(144) }
# iterated: a block per 32K, each a zero byte repeated
$1 == "COMDAT" {
	l = x($4)
	h(2); h(0); h(1); w(0); h(0); h(0); h(x($2)); h(x($3))
	for (o = 0; o < l; o += c) { c = l - o > 32768 ? 32768 : l - o; w(c); w(0); h(1); h(0) }
	out(194)
}
$1 == "MODEND" { h(0); out(138) }
