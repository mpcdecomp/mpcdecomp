#include "mpc2k.h"

int __far __pascal timer_io_setup(int p0)
{
	int i;

	if ((unsigned)(p0 - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) goto none;
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
