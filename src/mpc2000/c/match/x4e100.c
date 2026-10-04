#include "mpc2kxl.h"

extern char C2_TBL_02CB4[1];
extern char C2_TBL_02CB6[1];

void __far __fastcall __loadds pgm_assign_open_window(void)
{
	if (!(*(int *)(C2_TBL_02CB6 + C2_W_PGM_ASSIGN_CURSOR * 42) | *(int *)(C2_TBL_02CB4 + C2_W_PGM_ASSIGN_CURSOR * 42))) goto br_4E123;
	pgm_assign_refresh();
	((int (__far *)(void))*(long *)(C2_TBL_02CB4 + C2_W_PGM_ASSIGN_CURSOR * 42))();
br_4E123:
	;
}
