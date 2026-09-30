# SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
# Noncommercial use only; see LICENSE.txt.
#
# Required Notice: Copyright 2026 Brock Rockman
#
# Run in mpcdecomp-aztec by `make mpc60-aztec-check`, with the repository at
# /s and the build directory at /r: rebuilds the MPC60's runtime library block
# from Manx's sources and src/mpc60/c/match with Aztec C86 3.4b, links both with its
# ln at the ROM's addresses, and compares the bytes with the built images.
set -e
cd "$(mktemp -d)"
S=/s R=/r fail=0

# version:ln -C paragraph:bytes to atoi:ctp__ (DS):atoi in ROM:ctp__ in ROM
LIB="112:E93C:6:3FFA:293C6:304AA 212:F0C7:8:4798:30C78:38838 214:F233:9:4B14:32339:3A5D4"
# name:v2.14 ROM offset:length
APP="far_d97f5:197F5:37 far_da067:1A067:28 far_da083:1A083:58 far_da0bd:1A0BD:52
     far_e1617:21617:36 far_e2fd8:22FD8:60 far_e4b4f:24B4F:66 far_e544a:2544A:69 far_efe2c:2FE2C:45"
DATA="B_A426 W_A61A B_A61C B_A622 TBL_5517 W_8D82 W_8D7C W_53D5 W_8D84"

# A Manx .ARC is plain text: each member starts at a line "\f<name>".
unarc() {
	awk -v want=" $2 " '
	substr($0, 1, 1) == "\f" { n = substr($0, 2); sub(/\r$/, "", n)
		f = index(want, " " n " ") ? n : ""; next }
	f != "" { print > f }' "$1"
}
# C: -A stops at the .asm; as -S (squeezing jumps) is for compiler output
# only, as the library's own .asm keeps a long forward jmp in lsubs.
cc() { for f in $2; do echo "cc -A $1 -ID:\\INCLUDE\\ $f.c"; echo "as -S $f.asm"; done; }
# the stub that places the link: an empty code segment to start at, and data
stub() {
	printf '\tlargecode\r\ncodeseg segment para public '"'"'code'"'"'\r\n\tpublic $begin\r\n$begin:\r\n%s\r\ncodeseg ends\r\n' "$1"
	printf 'dataseg segment para public '"'"'data'"'"'\r\n'; cat; printf 'dataseg ends\r\n\tend\r\n'
}

# The library: 3.40b's sources compiled +M (constant multiplies by `mul`),
# but the older lsubs.asm and cswit.asm that 3.20d ships.  Link order is the
# ROM's; ln takes a long list from a file, as DOS stops a line at 127.
unarc /opt/aztec/SRC/MISC.ARC "atoi.c atol.c qsort.c format.c ctype.c"
unarc /opt/aztec/SRC/MCH86.ARC "index.asm peek.asm port.asm setmem.asm strcat.asm strcpy.asm strncpy.asm toupper.asm strcmp.asm strlen.asm movmem.asm swapmem.asm"
unarc /opt/aztec/SRC/MCH86_32.ARC "lsubs.asm cswit.asm"
echo "pad.o ctype.o atoi.o atol.o qsort.o cswit.o index.o peek.o port.o setmem.o strcat.o strcpy.o strncpy.o toupper.o lsubs.o strcmp.o strlen.o movmem.o format.o swapmem.o" > lib.lnk
# pad.asm puts atoi at its ROM address and ctp__ at its DS offset; ln starts
# data at offset 2.
printf '\tdb PADD dup (0)\r\n' | stub '	db PADC dup (0)' > pad.asm

# The application's C: +F (fast code), no +M.  The data it names sit at
# their v2.14 offsets from symbols.inc.
cp "$S"/src/mpc60/c/match/*.c .
app=$(cd "$S"/src/mpc60/c/match && ls *.c | sed 's/\.c$//')
for n in $DATA; do
	v=$(awk -v n=$n '$1 == n && $2 == "equ" { print $3 }' "$S"/src/mpc60/v214/symbols.inc)
	echo "$((0x${v%h})) $n"
done | sort -n | while read v n; do
	printf '\tpublic %s_\r\n\torg 0%Xh\r\n%s_ label byte\r\n' $n $((v - 2)) $n
done | stub '' > data.asm

{
	cc "+LC +M -n" "atoi atol qsort format ctype"
	for f in cswit index peek port setmem strcat strcpy strncpy toupper lsubs strcmp strlen movmem swapmem; do
		echo "as -DMODEL=1 -ID:\\INCLUDE\\ $f.asm"
	done
	for v in $LIB; do
		IFS=:; set -- $v; unset IFS
		echo "as -DPADC=$3 -DPADD=0$(printf '%X' $((0x$4 - 2)))h pad.asm"
		echo "ln -C $2 -D 0 -T -o lib$1.exe -F lib.lnk"
	done
	cc "+LC +F -n" "$app"
	echo "as data.asm"
	echo "ln -C C000 -D 0 -T -o app.exe data.o $(echo $app | sed 's/\([^ ]*\)/\1.o/g')"
} | sed 's/$/ >> LOG.TXT\r/' > GO.BAT
# DOSBox passes no exit status on, so a missing output is the failure.
printf 'exit\r\n' >> GO.BAT
dosbox -c "config -set cpu cycles=max" -c "mount c $PWD" -c "mount d /opt/aztec" \
	-c 'path d:\bin' -c 'c:' -c 'go.bat' >/dev/null 2>&1

# ssss:oooo of name in ln's symbol table, as a linear address
sym() { awk -v n="$2" '{ sub(/\r$/, "") } $2 == n { split($1, a, ":"); print a[1] " " a[2] }' "$1" |
	{ read s o && echo $((0x$s * 16 + 0x$o)); }; }
hdr() { echo $(( $(od -An -tu2 -j8 -N2 "$1") * 16 )); }
same() {	# what file offset rom offset length
	if cmp -s -n $6 "$2" "$4" $3 $5; then echo "  $1: $6 bytes match"
	else echo "  $1: $(cmp -l -n $6 "$2" "$4" $3 $5 | wc -l) of $6 bytes DIFFER"; fail=1; fi
}
for f in LIB112 LIB212 LIB214 APP; do [ -s $f.EXE ] || { tr -d '\r' < LOG.TXT; exit 1; }; done

for v in $LIB; do
	IFS=:; set -- $v; unset IFS
	h=$(hdr LIB$1.EXE) c0=$(sym LIB$1.SYM _Corg_) c1=$(sym LIB$1.SYM _Cend_)
	echo "MPC60 v$1 runtime library"
	same "code at $5" LIB$1.EXE $((h + $(sym LIB$1.SYM atoi_) - c0)) $R/mpc60-v$1/MPC60.BIN $((0x$5)) 2114
	same "ctype and digits at $6" LIB$1.EXE $((h + (c1 - c0 + 15) / 16 * 16 + 0x$4)) $R/mpc60-v$1/MPC60.BIN $((0x$6)) 146
done
h=$(hdr APP.EXE)
echo "MPC60 v2.14 application functions"
for f in $APP; do
	IFS=:; set -- $f; unset IFS
	same "$1 at $2" APP.EXE $((h + $(sym APP.SYM $1_) - 0xC0000)) $R/mpc60-v214/MPC60.BIN $((0x$2)) $3
done
exit $fail
