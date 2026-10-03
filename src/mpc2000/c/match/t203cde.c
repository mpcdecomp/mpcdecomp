#include "mpc2k.h"

void __far __fastcall __loadds far_03DAA(void)
{
#if FW_VERSION == 172
	B_9A4C |= 1;
#else
	B_980B_V150 = 1;
#endif
	W_9A42 = W_64C6;
	W_9A46 = W_64CA;
	return (int)W_9A46;
}
