#include "mpc2k.h"

int __far __pascal mem_block_process(char __far *p, int mode)
{
	if (mode == 1) {
		if (int2F_call_fn4(p) != -1) return 1;
		G_ERRNO = 0x0c;
	} else
		switch (int2F_call_fn7((long)p)) {
		case 0:
			return 1;
		case 1:
			G_ERRNO = 0x0f;
			break;
		case 2: case 3:
			G_ERRNO = 0x10;
			break;
		case 4:
			G_ERRNO = 0x11;
		}
	return 0;
}
