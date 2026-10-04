#include "mpc2kxl.h"

void __far __fstrncpy(char far *, char far *, int);

void __far filename_split(char far *p0, char far *p2, char far *p4)
{
	if (!p2) goto br_42FD4;
	__fstrncpy(p2, p0, 0x10);
	p2[16] = 0;
br_42FD4:
	if (!p4) goto br_42FFF;
	__fstrncpy(p4, p0 + 0x10, 4);
	p4[4] = 0;
br_42FFF:
	;
}
