# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# Run in mpcdecomp-borland by `make mpc3000-borland-check`, with the
# repository at /s and the build directory at /r: takes the MPC3000's runtime
# library modules out of CL.LIB and compiles src/mpc3000/c with Borland C++
# 3.1, links both with TLINK against a stub that puts DGROUP's names at the
# ROM's offsets, and compares the bytes with the built images.
set -e
cd "$(mktemp -d)"
S=/s R=/r fail=0

# version:_ctype (DS):QSORT's _BSS (DS):F_LXMUL@ in ROM:_ctype in ROM
LIB="308:6D84:E79C:7A0B6:36D84 311:78EC:FD02:7A0C8:278EC 312:79A4:FDBC:7A0C8:279A4"
# name:v3.08 offset:v3.11 offset:v3.12 offset:length, or length/v3.11/v3.12
APP="fn_b0f4b:37DDF:30F4B:30F4B:51 fn_b0f7e:37E12:30F7E:30F7E:32 far_b0fe4:37E78:30FE4:30FE4:49
     far_b1941:387D5:31941:31941:39 fn_b484b:3B7E3:3484B:3484B:40 fn_b8379:3EF36:38374:38379:51/52/52
     far_e26cc:6A7F8:62A56:626CC:47 far_e26fb:6A827:62A85:626FB:16 fn_e9324:71E04:695C6:69324:30"
DATA="W_9449 W_944D W_9451 W_D5DF TBL_A7B0"
# the modules the ROM links, in its order; two TLIB runs keep a line short
lib1="F_LXMUL F_SCOPY H_LDIV H_LLSH H_LRSH H_LURSH N_PCMP N_SCOPY"
lib2="TOLOWER TOUPPER ATOL LDIVT MOVMEM QSORT STRICMP STRNICMP CTYPE"
# The application's flags: -O2 for its loop rotation, inline strlen and
# register use, -1 for its `leave`, -k for a frame even with no arguments or
# locals.  -r- and -N each break a match.
bcc="bcc -c -ml -O2 -1 -k -ID:\\INCLUDE"
cp "$S"/src/mpc3000/c/leaf.c LEAF.C

# DGROUP comes first in each link, so a DGROUP offset in the stub is one in
# the image; the code follows.
seg() {
	printf 'DGROUP group _DATA, _BSS\r\n_DATA segment word public '"'"'DATA'"'"'\r\n'; cat
	printf '_DATA ends\r\n_BSS segment word public '"'"'BSS'"'"'\r\n%s\r\n_BSS ends\r\n\tend\r\n' "$1"
}
{
	for l in "$lib1" "$lib2"; do echo "tlib D:\\LIB\\CL.LIB $(printf '*%s ' $l)"; done
	for v in $LIB; do
		IFS=:; set -- $v; unset IFS
		# _ctype, then _BSS padded so QSORT's lands at its ROM offset
		b=$(( 0x$3 - (0x$2 + 257 + 1) / 2 * 2 ))
		printf '\tdb 0%sh dup (?)\r\n' $2 | seg "$(printf '\tdb 0%Xh dup (?)' $b)" > L$1.ASM
		{ printf 'L%s' $1; printf ' +\r\n%s' $lib1 $lib2; printf '\r\nL%s\r\nL%s\r\n' $1 $1; } > L$1.RSP
		echo "tasm /ml L$1.ASM"; echo "tlink /m /s /n @L$1.RSP"
		for n in $DATA; do
			x=$(awk -v n=$n '$1 == n && $2 == "equ" { print $3 }' "$S"/src/mpc3000/v$1/symbols.inc)
			echo "$((0x${x%h})) $n"
		done | sort -n | while read x n; do
			printf '\tpublic _%s\r\n\torg 0%Xh\r\n_%s label byte\r\n' $n $x $n
		done | seg "" > D$1.ASM
		echo "$bcc -DFW_VERSION=$1 -oLEAF$1.OBJ LEAF.C"
		echo "tasm /ml D$1.ASM"; echo "tlink /m /s /n D$1 LEAF$1, A$1, A$1;"
	done
} | sed 's/$/ >> LOG.TXT\r/' > GO.BAT
# DOSBox passes no exit status on, so a missing output is the failure.  The
# `exit` has to be in the batch: once BCC's DOS extender has run, the shell
# takes no more commands from DOSBox's command line.
printf 'exit\r\n' >> GO.BAT
dosbox -c "config -set cpu cycles=max" -c "mount c $PWD" -c "mount d /opt/bcpp31" \
	-c 'path d:\bin' -c 'set tmp=c:\' -c 'c:' -c 'go.bat' >/dev/null 2>&1

# linear address of a public in a TLINK map (TLINK uppercases without /c)
sym() { awk -v n="$2" '{ sub(/\r$/, "") } toupper($NF) == toupper(n) && $1 ~ /^[0-9A-F]+:[0-9A-F]+$/ {
	split($1, a, ":"); print a[1] " " a[2]; exit }' "$1" | { read s o && echo $((0x$s * 16 + 0x$o)); }; }
hdr() { echo $(( $(od -An -tu2 -j8 -N2 "$1") * 16 )); }
same() {	# what file offset rom offset length
	if cmp -s -n $6 "$2" "$4" $3 $5; then echo "  $1: $6 bytes match"
	else echo "  $1: $(cmp -l -n $6 "$2" "$4" $3 $5 | wc -l) of $6 bytes DIFFER"; fail=1; fi
}
for f in L308 A308 L311 A311 L312 A312; do [ -s $f.EXE ] || { tr -d '\r' < LOG.TXT; exit 1; }; done

k=1
for v in $LIB; do
	IFS=:; set -- $v; unset IFS
	ver=$1 rom=$R/mpc3000-v$1/MPC3000.BIN h=$(hdr L$1.EXE)
	echo "MPC3000 v$ver runtime library"
	same "_TEXT at $4" L$ver.EXE $((h + $(sym L$ver.MAP F_LXMUL@))) $rom $((0x$4)) 1738
	same "_ctype at $5" L$ver.EXE $((h + $(sym L$ver.MAP __ctype))) $rom $((0x$5)) 257
	echo "MPC3000 v$ver application functions"
	h=$(hdr A$ver.EXE) k=$((k + 1))
	for f in $APP; do
		IFS=:; set -- $f; unset IFS
		eval a=\$$k
		n=$(echo $5/$5/$5 | cut -d/ -f$((k - 1)))
		same "$1 at $a" A$ver.EXE $((h + $(sym A$ver.MAP _$1))) $rom $((0x$a)) $n
	done
done
exit $fail
