#include "mpc2kxl.h"

extern char C0_TBL_03EDE[1];
extern char C0_TBL_03EE0[1];

void __far __fastcall __loadds L_3C678(void)
{
	((void (__near *)(int, int))fn_3C6CC)(*(int *)(C0_TBL_03EDE + (((*(unsigned char *)&C0_B_08D86) & 1) + C0_B_03EDC * 2) * 8), *(int *)(C0_TBL_03EE0 + (((*(unsigned char *)&C0_B_08D86) & 1) + C0_B_03EDC * 2) * 8));
}
