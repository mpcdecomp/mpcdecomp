/* MPC2000 SYS text1: the MIXER screen's cursor keys and entry. */

#include "mpc2k.h"

/* Two columns of two: the cursor moves by one down a column, by two across. */
void __far __loadds __fastcall X_036AE(void)
{
	if ((*(signed char *)&MIXSRC_CURSOR) < 3)
		(*(signed char *)&MIXSRC_CURSOR)++;
	mixer_arm_field();
}

void __far __loadds __fastcall X_036C4(void)
{
	if ((*(signed char *)&MIXSRC_CURSOR) > 1)
		(*(signed char *)&MIXSRC_CURSOR) -= 2;
	mixer_arm_field();
}

void __far __loadds __fastcall X_036DC(void)
{
	if ((*(signed char *)&MIXSRC_CURSOR) < 2)
		(*(signed char *)&MIXSRC_CURSOR) += 2;
	mixer_arm_field();
}

void __far __loadds __fastcall mixer_setup(void)
{
	(*(void (__far **)(void))&FP_POLL_HOOK) = 0;
	PAD_INPUT_MODE = 2;
	win_keys_merge(TBL_WINKEYS_01264);
	mixer_arm_field();
}
