#include "mpc2k.h"

void __far __fastcall __loadds L_03698(void)
{
	if ((*(char *)&MIXSRC_CURSOR) <= 0) goto X_036A9;
	(*(char *)&MIXSRC_CURSOR)--;
X_036A9:
	mixer_arm_field();
}
