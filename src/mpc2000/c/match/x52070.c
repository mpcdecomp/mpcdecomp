#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_open(void)
{
	if (!(*(int *)(((char *)&C2_TBL_MIXER_FIELD_ENTER_SEG) + C2_W_MIXER_CURSOR * 42) | *(int *)(((char *)&C2_TBL_MIXER_FIELD_ENTER) + C2_W_MIXER_CURSOR * 42))) goto br_52093;
	mixer_refresh();
	((int (__far *)(void))*(long *)(((char *)&C2_TBL_MIXER_FIELD_ENTER) + C2_W_MIXER_CURSOR * 42))();
br_52093:
	;
}
