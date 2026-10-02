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
# name:v3.08 offset:v3.11 offset:v3.12 offset:length, or length/v3.11/v3.12;
# - for a version without it
APP="fn_b034e:37225:3034E:3034E:6 fn_b0f4b:37DDF:30F4B:30F4B:51 fn_b0f7e:37E12:30F7E:30F7E:32
     far_b0fe4:37E78:30FE4:30FE4:49 far_b1941:387D5:31941:31941:39 far_b284a:39706:3284A:3284A:6
     fn_b484b:3B7E3:3484B:3484B:40 fn_b5183:3C11C:35183:35183:66 far_b6cd3:3D8B1:36CCE:36CD3:29
     fn_b8379:3EF36:38374:38379:51/52/52 fn_c0180:496E1:40079:40180:20 fn_c1e77:4B389:41D43:41E77:24
     far_c46ab:4DBBC:44577:446AB:20 fn_c8c0a:51F06:48A79:48C0A:83 far_cab20:53FE9:4A98F:4AB20:20
     far_cab34:53FFD:4A9A3:4AB34:20 far_cab48:54011:4A9B7:4AB48:20 far_cace7:541B0:4AB56:4ACE7:24
     fn_d5460:5E800:55CD2:55460:61 far_d9748:6214E:59ACE:59748:18 far_da3fa:62E6C:5A780:5A3FA:5
     fn_da7df:631F9:5AB65:5A7DF:1 fn_daa7f:63499:5AE05:5AA7F:3 far_dab06:63520:5AE8C:5AB06:49
     far_dab37:63551:5AEBD:5AB37:53 far_dab6c:63586:5AEF2:5AB6C:59 far_dad20:6373A:5B0A6:5AD20:52
     far_dd1f5:6584B:5D57B:5D1F5:29 far_e26cc:6A7F8:62A56:626CC:47 far_e26fb:6A827:62A85:626FB:16
     fn_e483e:6C93B:64BC8:6483E:55 fn_e7623:702A0:679AD:67623:33 fn_e9324:71E04:695C6:69324:30
     far_eb837:72E59:6BAD9:6B837:14"
# the modules the ROM links, in its order; two TLIB runs keep a line short
lib1="F_LXMUL F_SCOPY H_LDIV H_LLSH H_LRSH H_LURSH N_PCMP N_SCOPY"
lib2="TOLOWER TOUPPER ATOL LDIVT MOVMEM QSORT STRICMP STRNICMP CTYPE"
# The application's flags: -O2 for its loop rotation, inline strlen and
# register use, -1 for its `leave`, -k for a frame even with no arguments or
# locals.  -r- and -N each break a match.
bcc="bcc -c -ml -O2 -1 -k -ID:\\INCLUDE"
# c/match/*.c as M1.C, M2.C, ...: DOS names
k=0
for f in "$S"/src/mpc3000/c/match/*.c; do k=$((k + 1)); cp "$f" M$k.C; done
# the names match/ declares extern and does not define
for f in $APP; do echo ${f%%:*}; done | sort > DEF
grep -h '^extern' "$S"/src/mpc3000/c/match/*.c | tr -c 'A-Za-z0-9_' '\n' | sort -u | comm -23 - DEF > USE

# DGROUP comes first in each link, so a DGROUP offset in the stub is one in
# the image; the code follows.  $2: what follows DGROUP.
seg() {
	printf 'DGROUP group _DATA, _BSS\r\n_DATA segment word public '"'"'DATA'"'"'\r\n'; cat
	printf '_DATA ends\r\n_BSS segment word public '"'"'BSS'"'"'\r\n%s\r\n_BSS ends\r\n%s\r\n\tend\r\n' "$1" "$2"
}
# a far function of the image the C calls: an absolute segment at the
# segment:offset the image's own `callf`s give it (from the listing).  A name
# a version's code does not call by that name is the one its live label at
# the same place has: labels with no bytes between them are one place.
far() {
	awk 'NR == FNR { u[$1]; next }
	{ for (i = 1; i <= NF && $i != ":"; i++) ; b = $(i + 1) }
	b ~ /^[0-9A-F][0-9A-F]$/ { g++ }
	NF == i + 1 && b ~ /^[A-Za-z_][A-Za-z0-9_]*:$/ { sub(/:$/, "", b); at[b] = g }
	b == "9A" && /callf/ { n = $NF; sub(/.*:/, "", n)
		if (!(n in so)) so[n] = $(i + 5) $(i + 4) " " $(i + 3) $(i + 2) }
	END {
		for (n in so) if (n in at) by[at[n]] = so[n]
		for (n in u) {
			s = (n in so) ? so[n] : (n in at) && (at[n] in by) ? by[at[n]] : ""
			if (s == "") continue
			split(s, a, " ")
			printf "X%d segment at 0%sh\r\n\torg 0%sh\r\n\tpublic _%s\r\n_%s label far\r\nX%d ends\r\n",
				++k, a[1], a[2], n, n, k
		} }' USE "$R"/mpc3000-v$1/image.lst
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
		awk 'NR == FNR { u[$1]; next } $2 == "equ" && ($1 in u) { print $1, $3 }' USE \
			"$S"/src/mpc3000/v$1/symbols.inc | while read n x; do
			echo "$((0x${x%h})) $n"
		done | sort -n | while read x n; do
			printf '\tpublic _%s\r\n\torg 0%Xh\r\n_%s label byte\r\n' $n $x $n
		done | seg "" "$(far $1)" > D$1.ASM
		for j in $(seq $k); do echo "$bcc -DFW_VERSION=$1 -oM${j}V$1.OBJ M$j.C"; done
		{ printf 'D%s' $1; for j in $(seq $k); do printf ' +\r\nM%sV%s' $j $1; done
		  printf '\r\nA%s\r\nA%s\r\n' $1 $1; } > A$1.RSP
		echo "tasm /ml D$1.ASM"; echo "tlink /m /s /n @A$1.RSP"
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
		[ "$a" = - ] && continue
		n=$(echo $5/$5/$5 | cut -d/ -f$((k - 1)))
		same "$1 at $a" A$ver.EXE $((h + $(sym A$ver.MAP _$1))) $rom $((0x$a)) $n
	done
done
exit $fail
