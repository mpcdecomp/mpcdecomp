/* MPC2000 SYS text1: the RECORD screen's cursor keys. */

#include "mpc2k.h"

/* Two rows of three fields. */
void __far __loadds __fastcall X_07488(void)
{
	if ((*(signed char *)&REC_CURSOR) >= 3) {
		(*(signed char *)&REC_CURSOR) -= 3;
		rec_arm_field();
	}
}

void __far __loadds __fastcall X_074A0(void)
{
	if ((*(signed char *)&REC_CURSOR) < 3) {
		(*(signed char *)&REC_CURSOR) += 3;
		rec_arm_field();
	}
}

void __far __loadds __fastcall X_074B8(void)
{
	if ((*(signed char *)&REC_CURSOR) > 0) {
		(*(signed char *)&REC_CURSOR)--;
		rec_arm_field();
	}
}

void __far __loadds __fastcall X_074CE(void)
{
	if ((*(signed char *)&REC_CURSOR) < 5) {
		(*(signed char *)&REC_CURSOR)++;
		rec_arm_field();
	}
}
