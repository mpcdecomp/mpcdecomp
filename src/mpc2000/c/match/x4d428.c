#include "mpc2kxl.h"

extern char C2_TBL_0289E[1];
extern char C2_TBL_028A0[1];

void __far __fastcall __loadds zone_screen_open(void)
{
	if (!(*(int *)(C2_TBL_028A0 + C2_W_ZONE_CURSOR * 42) | *(int *)(C2_TBL_0289E + C2_W_ZONE_CURSOR * 42))) goto br_4D44B;
	zone_screen_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_0289E + C2_W_ZONE_CURSOR * 42))();
br_4D44B:
	;
}
