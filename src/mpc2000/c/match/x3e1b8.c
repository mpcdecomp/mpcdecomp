#include "mpc2kxl.h"

int __far detect_memory(void)
{
	return -(0 - ((inp(192) & 1) == 0));
}
