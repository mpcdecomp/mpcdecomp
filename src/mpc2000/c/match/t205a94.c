#include "mpc2k.h"

int __far __pascal timer_io_setup(int p0)
{
	int i;

	if ((unsigned)(p0 - 0x23) > 0x3f) goto none;
	i = 0;
loop:
	if (PTR_TRACK_DATA[i] == p0) goto found;
	i++;
	if (i < 0x40) goto loop;
	goto none;
found:
	return i;
none:
	return -1;
}
