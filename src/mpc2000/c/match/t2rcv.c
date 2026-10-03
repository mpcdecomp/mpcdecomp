/* MPC2000 SYS text2: the load/receive windows' key hooks. */

#include "mpc2k.h"

typedef void (far *fn)(void);

/* close the window, then run the caller's continuation */
void __fastcall __loadds L_0CDEC(void)
{
	far_0AD74();
	(*(*(void (__far **)(void))W_5138))();
}

void __fastcall __loadds L_0CDFE(void)
{
	far_0AD74();
	(*(*(void (__far **)(void))W_513C))();
}
