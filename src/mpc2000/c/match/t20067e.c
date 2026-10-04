#include "mpc2k.h"

int __far __pascal mem_block_process(char __far *p, int mode)
{
	if (mode == 1) {
		if (int2F_call_fn4(p) != -1) return 1;
		G_ERRNO = ERR_CANT_OPEN;
	} else
		switch (int2F_call_fn7((long)p)) {
		case 0:
			return 1;
		case 1:
			G_ERRNO = ERR_WRITE_PROTECTED;
			break;
		case 2: case 3:
			G_ERRNO = ERR_NO_DISK_SPACE;
			break;
		case 4:
			G_ERRNO = ERR_WRONG_DISK_FORMAT;
		}
	return 0;
}
