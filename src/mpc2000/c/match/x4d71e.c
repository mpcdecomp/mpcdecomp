#include "mpc2kxl.h"

extern char C0_B_0D7DD;
extern char C0_TBL_08E72[1];
extern char C0_TBL_08E74[1];
extern long C0_W_0D7C2;
extern char C2_TBL_029D6[1];
extern char C2_W_0294A[1];

void __far L_4D71E(void)
{
	((void (__far *)(char __far *))handler_set_install)(C2_W_0294A);
	if (C2_W_08D5A < 0) goto br_4D738;
	if ((unsigned)C2_W_08D5A < 2) goto br_4D73E;
br_4D738:
	C2_W_08D5A = 0;
br_4D73E:
	((void (__far *)(long, int, int))far_4B16C)(C0_W_0D7C2, *(int *)(C0_TBL_08E72 + C0_B_0D7DD * 4), *(int *)(C0_TBL_08E74 + C0_B_0D7DD * 4));
	((int (__far *)(void))*(long *)(C2_TBL_029D6 + C2_W_08D5A * 42))();
}
