#include "mpc2k.h"

int __far __fstricmp(long, long);

void __far __pascal bcd_convert(char far *p2, char far *p0)
{
	switch (__fstricmp(p2, p0)) { case 0: goto br_009E0; }
	((void (__far __pascal *)(long, long))bcd_arithmetic_1)(p2, p0);
br_009E0:
	;
}
