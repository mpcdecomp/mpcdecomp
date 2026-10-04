#include "mpc2k.h"

void __far __fastcall __loadds timer_poll_wait_2(void)
{
	unsigned char l1;

	l1 = pad_bank_get();
	l1++;
	l1 &= 3;
	int3F_wrapper(l1);
	G_PAD_INDEX = (l1 << 4) + (G_PAD_INDEX & 0xf);
	L_054DC();
}
