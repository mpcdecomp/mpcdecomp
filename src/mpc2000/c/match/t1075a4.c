#include "mpc2k.h"

void __far __fastcall __loadds L_07524(void)
{
	fn_06EF2();
	int44_wrapper(1);
	((void (__far *)(void (__far *)(void)))callback_set_main)(sample_error_handler);
	P_0610 = 1;
	dma_018ee();
}
