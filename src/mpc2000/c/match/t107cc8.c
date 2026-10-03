#include "mpc2k.h"

void __far __fastcall __loadds X_07C48(void)
{
	if (LOOP_FINE_CURSOR >= 3) goto L_07C59;
	LOOP_FINE_CURSOR++;
L_07C59:
	L_07BDE();
}
