#include "mpc2kxl.h"

extern char C2_TBL_01828[1];
extern char C2_TBL_0182A[1];

void __far __fastcall __loadds trim_screen_open(void)
{
	if (!(*(int *)(C2_TBL_0182A + C2_W_TRIM_CURSOR * 42) | *(int *)(C2_TBL_01828 + C2_W_TRIM_CURSOR * 42))) goto br_49FE7;
	trim_screen_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_01828 + C2_W_TRIM_CURSOR * 42))();
br_49FE7:
	;
}
