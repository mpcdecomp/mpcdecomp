#include "mpc2kxl.h"

int __far detect_memory(void)
{
	return -(0 - ((inp(FLASH_CTL) & 1) == 0));
}
