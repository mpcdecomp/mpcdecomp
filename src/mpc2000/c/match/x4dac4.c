#include "mpc2kxl.h"

extern char C0_B_0D7DD;
extern char C0_TBL_08E76[1];
extern char C0_TBL_08E78[1];
extern long C0_W_0D7C2;

void __far L_4DAC4(void)
{
	((void (__far *)(long, int, int))far_4B16C)(C0_W_0D7C2, *(int *)(C0_TBL_08E76 + C0_B_0D7DD * 4), *(int *)(C0_TBL_08E78 + C0_B_0D7DD * 4));
}
