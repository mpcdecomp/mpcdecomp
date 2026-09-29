# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# Run in mpcdecomp-msc by `make mpc2000-msc-check`, with the repository at /s
# and the build directory at /r: takes the runtime library modules the 2K SYS
# and XL images link out of Visual C++ 1.52's LLIBCE.LIB, compiles
# src/mpc2000/c with its C/C++ 8.00c, links both with its LINK against a stub
# that puts DGROUP's names at the image's offsets, and compares the bytes.
set -e
cd "$(mktemp -d)"
S=/s R=/r fail=0

# image:runtime block's file offset:_ldiv's buffer (DS)
LIB="xl-v107:34C1A:77C6 xl-v110:3511A:77CC xl-v111:3521A:77CC xl-v112:3531A:77CC
     xl-v114:3551A:77CC xl-v120:35B1A:77CC 2k-v150-sys:261C:4322 2k-v172-sys:281C:455E"
# the modules, in the images' order, and the public each starts with; the
# 2K links no aFN/aFF stubs but aFFalmul, and no strupr
XL="afuldiv:__aFuldiv aflmul:__aFlmul afldiv:__aFldiv aflrem:__aFlrem afnaldiv:__aFNaldiv
    affalmul:__aFFalmul affaldiv:__aFFaldiv div:_div longdiv:_ldiv setjmp:__setjmp
    fstricmp:__fstricmp fstrncpy:__fstrncpy fstrupr:__fstrupr"
K=$(echo $XL | tr ' ' '\n' | grep -v -e afnaldiv -e affaldiv -e fstrupr)
# The XL's names at their DS offsets; the 2K's come from bss_check.inc.
APPX="P_9A4E=D7FE TBL_574E=8F44 VOICE_TIMER=8F04 VOICE_HOLD=8EC4 TBL_578E=8F84
      VOICE_TABLE=9609 B_0494=0494 TBL_073C=073C"
K_DATA="P_9A4E TBL_574E VOICE_TIMER VOICE_HOLD TBL_578E VOICE_TABLE G_PENDING_DMA_MASK"
# name:file offset, in leaf.c's order: LINK's map gives a COMDAT's place and
# length but not its name
FN120="voice_release:41BC6 L_3E4EE:3E4EE far_3F46E:3F46E far_3F556:3F556 L_3F9AC:402DC
       fs_error_msg:42830"
FN150="voice_release:1028A pending_ops_set:F4E2"
FN172="voice_release:107D0 pending_ops_set:FA22"
# /Ox for far_3F556's loop, tested at the bottom, and outp inline; /Gy puts
# each function in its own COMDAT, which LINK word-aligns with a zero: the
# images' pad after an odd-length function is 00, not CL's nop.
cl="cl /nologo /c /AL /G2 /Ox /Gy"
cp "$S"/src/mpc2000/c/leaf.c LEAF.C

# An OMF object with one paragraph-aligned _DATA segment of length $1 in
# DGROUP and the rest of the arguments, name=offset, public in it.  Linked
# first, it puts DGROUP at 0, so an offset in it is one in the image.
bin() { for h; do printf "\\$(printf %03o 0x$h)"; done; }
hex() { printf %s "$1" | od -An -tx1; }
rec() { r=$1; shift; bin $r $(printf "%02X %02X" $(($# + 1)) 0) "$@" 00; }
stub() {
	l=$1; shift
	rec 80 04 $(hex STUB)
	rec 96 00 05 $(hex _DATA) 04 $(hex DATA) 06 $(hex DGROUP)
	rec 98 68 $(printf '%02X %02X' $((0x$l & 255)) $((0x$l >> 8))) 02 03 01
	rec 9A 04 FF 01
	for p; do
		o=${p#*=} n=_${p%%=*}
		rec 90 01 01 $(printf %02X ${#n}) $(hex $n) $(printf '%02X %02X' $((0x$o & 255)) $((0x$o >> 8))) 00
	done
	rec 8A 00
}
# LINK's response file: an object a line, run file, map
rsp() { echo $2 | sed 's/ /+ /g' | tr ' ' '\n' | sed 's/$/\r/'; printf '%s\r\n' $1.EXE "$1.MAP /map:full /nod /noi /nopackf;"; }

{
	printf 'd:\\lib\\llibce.lib\r\n'
	for m in $XL; do printf '*%s &\r\n' ${m%%:*}; done
	printf ';\r\n'
} > X.RSP
{
	echo 'lib /nologo @X.RSP'
	for v in $LIB; do
		IFS=:; set -- $v; unset IFS
		t=$1; case $t in xl*) mods=$XL;; *) mods=$K;; esac
		t=$(echo $t | tr -d -- '-sy' | tr a-z A-Z)
		stub $3 > P$t.OBJ
		rsp L$t "P$t $(for m in $mods; do printf '%s ' ${m%%:*}; done)" > L$t.RSP
		echo "link /nologo @L$t.RSP"
	done
	echo "$cl /DXL /FoLEAFX.OBJ LEAF.C"
	echo "$cl /FoLEAFK.OBJ LEAF.C"
	stub E000 $APPX > D120.OBJ
	rsp A120 "D120 LEAFX" > A120.RSP; echo "link /nologo @A120.RSP"
	for v in 150 172; do
		for n in $K_DATA; do
			echo "$n=$(awk -v n=$n '$1 == "BSSCHK" && $2 == n "," { sub(/^0/, "", $3); sub(/h$/, "", $3); print toupper($3) }' \
				"$S"/src/mpc2000/2k/v$v/sys/bss_check.inc)"
		done > names; stub E000 $(cat names) > D$v.OBJ
		rsp A$v "D$v LEAFK" > A$v.RSP; echo "link /nologo @A$v.RSP"
	done
} > STEPS
# DOSBox passes no exit status on, so a missing output is the failure.  A
# batch runs nothing after CL has, so each CL ends one.
dos() {
	printf 'exit\r\n' >> GO.BAT
	dosbox -c "config -set cpu cycles=max" -c "mount c $PWD" -c "mount d /opt/msvc" \
		-c 'path d:\bin' -c 'set tmp=c:\' -c 'set include=d:\include' -c 'c:' -c 'go.bat' >/dev/null 2>&1
	: > GO.BAT
}
: > GO.BAT
while read -r l; do
	printf '%s >> LOG.TXT\r\n' "$l" >> GO.BAT
	case $l in cl\ *) dos;; esac
done < STEPS
dos

# linear address of a public, or of a segment's end, in a LINK map
sym() { awk -v n="$2" '{ sub(/\r$/, "") } $2 == n && $1 ~ /^[0-9A-F]+:[0-9A-F]+$/ {
	split($1, a, ":"); print a[1] " " a[2]; exit }' "$1" | { read s o && echo $((0x$s * 16 + 0x$o)); }; }
send() { awk -v n="$2" '{ sub(/\r$/, "") } $4 == n { print $1 " " $3; exit }' "$1" |
	{ read a l && echo $((0x${a%H} + 0x${l%H})); }; }
hdr() { echo $(( $(od -An -tu2 -j8 -N2 "$1") * 16 )); }
# linear address and length of each COMDAT LINK placed, in order
cdat() { awk '{ sub(/\r$/, ""); gsub(/H/, "") } $4 ~ /^COMDAT_SEG/ { b = $1; next }
	b != "" && $1 == "at" && $2 == "offset" { print b, $3, $4; next } { b = "" }' "$1" |
	while read b o l; do echo $((0x$b + 0x$o)) $((0x$l)); done; }
app() {	# run file, image, name:file offset in COMDAT order
	rom=$(img $2) h=$(hdr $1.EXE) f=$1; shift 2
	cdat $f.MAP > $f.CD
	for x; do
		read a l
		# CL ends a module on a word with a nop, where LINK pads a
		# function the image has further functions after with a zero
		[ $# -gt 1 ] || [ "$(od -An -tx1 -j $((h + a + l - 1)) -N1 $f.EXE)" != " 90" ] || l=$((l - 1))
		same "${x%:*} at ${x#*:}" $f.EXE $((h + a)) $rom $((0x${x#*:})) $l
		shift
	done < $f.CD
}
same() {	# what file offset image offset length
	if cmp -s -n $6 "$2" "$4" $3 $5; then echo "  $1: $6 bytes match"
	else echo "  $1: $(cmp -l -n $6 "$2" "$4" $3 $5 | wc -l) of $6 bytes DIFFER"; fail=1; fi
}
for f in LXLV107 LXLV120 L2KV150 L2KV172 A120 A150 A172; do [ -s $f.EXE ] || { tr -d '\r' < LOG.TXT; exit 1; }; done

img() { case $1 in xl*) echo $R/mpc2000-$1/MPC2KXL.BIN;; *) echo $R/mpc2000-$1/MPC2000.SYS;; esac; }
for v in $LIB; do
	IFS=:; set -- $v; unset IFS
	t=$(echo $1 | tr -d -- '-sy' | tr a-z A-Z) rom=$(img $1) base=$((0x$2))
	case $1 in xl*) mods=$XL; echo "MPC2000XL ${1#xl-} runtime library";;
		*) mods=$K; v=${1#2k-}; echo "MPC2000 ${v%-sys} SYS runtime library";; esac
	h=$(hdr L$t.EXE) m=L$t.MAP first=
	set -- $(for x in $mods; do echo ${x#*:}; done)
	while [ $# -gt 0 ]; do
		a=$(sym $m $1); [ -n "$first" ] || first=$a
		if [ $# -gt 1 ]; then e=$(sym $m $2); else e=$(send $m _TEXT); fi
		same "${1#_} at $(printf %X $((base + a - first)))" L$t.EXE $((h + a)) $rom $((base + a - first)) $((e - a))
		shift
	done
done
echo "MPC2000XL v120 application functions"
app A120 xl-v120 $FN120
for v in 150 172; do
	echo "MPC2000 v$v SYS application functions"
	eval app A$v 2k-v$v-sys \$FN$v
done
exit $fail
