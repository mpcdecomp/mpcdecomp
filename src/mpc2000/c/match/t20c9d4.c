#include "mpc2k.h"

void __far __fstrncpy(char far *, long, int);

int __far __pascal sample_access_short(long p0)
{
	char l18[18];

	__fstrncpy(l18, p0, 0x10);
	l18[16] = 0;
	return ((int (__far __pascal *)(long))sample_check_active)(sample_ptr_access(l18));
}
