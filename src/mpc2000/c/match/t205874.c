#include "mpc2k.h"

#pragma intrinsic(_fmemcpy)

char far * __far __pascal _memcpy_2(char far *p1, int p0)
{
	_fmemcpy(p1, STR_NEW_PROGRAM_NAME, 0x11);
	p1[12] = (char)((p0 + 1) / 0xa) + 0x30;
	p1[13] = (char)((p0 + 1) % 0xa) + 0x30;
	return p1;
}
