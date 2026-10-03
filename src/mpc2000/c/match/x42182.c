#include "mpc2kxl.h"

void * __cdecl memset(void *, int, unsigned);
#pragma intrinsic(memset)
extern char C1_W_081FA[1];

int __far L_42182(void)
{
	memset(C1_W_081FA, 0, 0x900);
	return 0;
}
