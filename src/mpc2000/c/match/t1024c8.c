#include "mpc2k.h"


void __far __fastcall __loadds L_02420(void)
{
#if FW_VERSION == 172
	if (SMEM_SIZE) {
#endif
		W_4EFC = 0;
		W_4EFC = (char)(((char (__near __pascal *)(char __near *))mem_test_init)((char __near *)mpc_mode_setup) + 1);
#if FW_VERSION == 172
		L_005B4();
	} else
		((void (__far __pascal *)(char __far *))string_fill_stosb)(STR_NO_WAVE_RAM);
#endif
}
