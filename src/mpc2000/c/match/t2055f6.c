#include "mpc2k.h"

#pragma intrinsic(memset)

void __far L_05760(void)
{
#if FW_VERSION == 172
	memset(B_9D5A, 0, 0x33);
#else
	memset(B_9D5A, 0, 0x32);
#endif
	memset(((char *)&SND_CURRENT), 0, 0x70);
	smem_io_helper();
	PAD_INPUT_MODE = 2;
	L_05844();
}
