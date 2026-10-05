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

# The application's C: +F (fast code), no +M.  c/check.txt names each
# function to compare (fn V NAME FILEOFF LEN FILE GROUP [PLACED]) and each far callee
# a group's link stubs, at the seg:off the ROM calls it by (call V GROUP NAME SEG:OFF).  ln gives a module
# the segment of the paragraph it starts in, so a stub module per callee
# segment, padded to the next, puts every callee where the ROM has it.  A
# group's files are linked together; none calls what another defines.
CK=$S/src/mpc60/c/check.txt
# DOS names: match/X.c compiles as mN.c
i=0; for f in $(cd "$S"/src/mpc60/c/match && ls *.c); do
	cp "$S"/src/mpc60/c/match/$f m$i.c; echo "$f m$i" >> fmap; i=$((i + 1)); done
app=$(awk '{ print $2 }' fmap)
cat "$S"/src/mpc60/c/match/*.c | grep -oE '[A-Z][A-Z0-9]*_[0-9A-F]{4}(_V[0-9]+)?' | sort -u > names
HEX='function hex(s,  i, n) { n = 0; for (i = 1; i <= length(s); i++)
	n = n * 16 + index("0123456789ABCDEF", toupper(substr(s, i, 1))) - 1; return n }'
seg() { printf "\tlargecode\r\ncodeseg segment para public 'code'\r\n"; }
ends() { printf "codeseg ends\r\ndataseg segment para public 'data'\r\ndataseg ends\r\n\tend\r\n"; }
links=""
for v in 214 212 112; do
	# the data the files name, at this version's DS offsets (ln starts data at
	# 2); a name this version lacks goes past them, for what isn't compared
	awk "$HEX"'
	NR == FNR { want[$1] = 1; next }
	{ for (i = 1; i < NF - 1; i++) if ($i ~ /^=[0-9A-F]+H$/ && ($(i + 1) in want) && $(i + 2) == "equ") {
		print hex(substr($i, 2, length($i) - 2)), $(i + 1); delete want[$(i + 1)] } }
	END { for (n in want) print 49152, n }' \
		names $R/mpc60-v$v/image.lst | sort -n | while read x n; do
		printf '\tpublic %s_\r\n\torg 0%Xh\r\n%s_ label byte\r\n' $n $((x - 2)) $n
	done | { seg; printf "codeseg ends\r\ndataseg segment para public 'data'\r\n"; cat
		printf 'dataseg ends\r\n\tend\r\n'; } > d$v.asm
	for g in $(awk -v v=$v '$1 == "fn" && $2 == v { print $7 }' $CK | sort -u); do
		# callees by address, less the names this group defines; a function
		# whose code holds its own offsets (switch tables) is placed: its
		# module starts where the ROM has it (fn line's 8th field)
		awk -v v=$v -v g=$g "$HEX"'
		FNR == 1 { p++ }
		p == 1 && $1 == "fn" && $2 == v && $7 == g { lk[$6] = 1 }
		p == 2 && $1 == "fn" && ($6 in lk) { def[$3 "_"] = 1 }
		p == 2 && $1 == "fn" && $2 == v && $7 == g && NF > 7 { print 786432 + hex($4), "P", $3, $6, $5 }
		p == 3 && $1 == "call" && $2 == v && $3 == g && !($4 in def) { split($5, a, ":")
			print hex(a[1]) * 16 + hex(a[2]), hex(a[1]), $4 }' $CK $CK $CK |
			sort -n -k1,1 > calls
		# a module's segment is the paragraph it starts in, and modules are
		# not aligned: stub i starts in its callees' paragraph, at the
		# earliest byte past stub i-1, and pads up to each callee
		# the link starts at C000h, or lower at the kernel's segment when a callee is there
		base=$(awk 'NR == 1 { b = $2 } END { print (b != "" && b != "P" && b < 49152) ? b : 49152 }' calls)
		echo $base > b$v$g
		n=0 sg0=-1 pos=$((base * 16)) msz=0 cur=s$v${g}0
		: > mods
		# pad by N bytes; a module stays under 64K, so a long gap takes fillers
		new() { ends >> $cur.asm; echo $cur >> mods; n=$((n + 1)) msz=0 cur=s$v$g$n; seg > $cur.asm; }
		pad() { k=$1; while [ $k -gt 0 ]; do
			[ $msz -lt 32000 ] || new
			j=$((32000 - msz)); [ $j -le $k ] || j=$k
			printf '\tdb %d dup (0)\r\n' $j >> $cur.asm
			msz=$((msz + j)) pos=$((pos + j)) k=$((k - j)); done; }
		{ seg; printf '\tpublic $begin\r\n$begin:\r\n'; } > $cur.asm
		while read x sg nm f c; do
			[ $x -ge $pos ] || { echo "$nm overlaps what is before it"; exit 1; }
			if [ $sg = P ]; then
				pad $((x - pos)); new
				awk -v f=$f '$1 == f { print $2 }' fmap >> mods
				pos=$((x + c)) sg0=-1
				continue
			fi
			if [ $sg != $sg0 ]; then
				[ $pos -ge $((sg * 16)) ] || pad $((sg * 16 - pos))
				[ $pos -lt $((sg * 16 + 16)) ] || { echo "no stub can start segment $sg for $nm"; exit 1; }
				new; sg0=$sg
			fi
			pad $((x - pos))
			printf '\tpublic %s\r\n%s label far\r\n' $nm $nm >> $cur.asm
		done < calls
		{ printf '\tdb 1 dup (0)\r\n'; ends; } >> $cur.asm
		echo $cur >> mods
		grep '^s' mods >> stubs
		{ sed 's/$/.o/' mods; echo d$v.o
		  awk -v v=$v -v g=$g 'NR == FNR { m[$1] = $2; next }
			$1 == "fn" && $2 == v && $7 == g && NF == 7 { print m[$6] ".o" }' fmap $CK | sort -u
		} | tr '\n' ' ' > a$v$g.lnk
		links="$links $v$g"
	done
done
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
	for f in d214 d212 d112 $(cat stubs); do echo "as $f.asm"; done
	for l in $links; do echo "ln -C $(printf %04X $(cat b$l)) -D 0 -T -o a$l.exe -F a$l.lnk"; done
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
for f in LIB112 LIB212 LIB214 $(for l in $links; do echo A$l; done); do [ -s $f.EXE ] || { tr -d '\r' < LOG.TXT; exit 1; }; done

for v in $LIB; do
	IFS=:; set -- $v; unset IFS
	h=$(hdr LIB$1.EXE) c0=$(sym LIB$1.SYM _Corg_) c1=$(sym LIB$1.SYM _Cend_)
	echo "MPC60 v$1 runtime library"
	same "code at $5" LIB$1.EXE $((h + $(sym LIB$1.SYM atoi_) - c0)) $R/mpc60-v$1/MPC60.BIN $((0x$5)) 2114
	same "ctype and digits at $6" LIB$1.EXE $((h + (c1 - c0 + 15) / 16 * 16 + 0x$4)) $R/mpc60-v$1/MPC60.BIN $((0x$6)) 146
done
for l in $links; do
	v=${l%?} g=${l#???} h=$(hdr A$l.EXE) b=$(($(cat b$l) * 16))
	echo "MPC60 v$v application functions, link $g"
	awk -v v=$v -v g=$g '$1 == "fn" && $2 == v && $7 == g { print $3, $4, $5 }' $CK > fns
	while read n o c; do
		same "$n at $o" A$l.EXE $((h + $(sym A$l.SYM ${n}_) - b)) $R/mpc60-v$v/MPC60.BIN $((0x$o)) $c
	done < fns
done
exit $fail
