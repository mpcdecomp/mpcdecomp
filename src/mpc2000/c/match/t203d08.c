#include "mpc2k.h"

void __far __fastcall __loadds L_03DD4(void)
{
#if FW_VERSION == 172
	B_9A4C &= ~1;
#else
	B_980B_V150 = 0;
#endif
	W_9A42 = W_64BE;
	W_9A46 = W_64C2;
	return (int)W_9A46;
}
