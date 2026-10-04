#include "mpc2k.h"

#pragma intrinsic(memset)

int __far far_01D98(void)
{
	memset(NOTE_HELD, 0, 0x180);
	return 0;
}
