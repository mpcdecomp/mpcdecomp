#include "mpc2kxl.h"

extern char C0_TBL_03EE2[1];
extern char C0_TBL_03EE4[1];

void __far __fastcall __loadds X_3C6A2(void)
{
	((void (__near *)(int, int))fn_3C6CC)(*(int *)(C0_TBL_03EE2 + (((*(unsigned char *)&C0_B_08D86) & 1) + C0_B_03EDC * 2) * 8), *(int *)(C0_TBL_03EE4 + (((*(unsigned char *)&C0_B_08D86) & 1) + C0_B_03EDC * 2) * 8));
}
