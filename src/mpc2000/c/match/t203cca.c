#include "mpc2k.h"

#if FW_VERSION == 172
extern int W_9A4A;
int __far L_03C6C(void);
#endif

void __far __fastcall __loadds tgt_03D80(void)
{
#if FW_VERSION == 172
	if (G_PAD_INDEX)
		G_PAD_INDEX--;
	if (L_03C6C() <= 1)
		W_9A4A = 1 << G_PAD_INDEX;
#else
	if (!G_PAD_INDEX) goto br_03DA7;
	G_PAD_INDEX--;
br_03DA7:
	;
#endif
}
