#include "mpc2kxl.h"

void __far __fastcall __loadds sample_dump_open(void)
{
	if (!(*(int *)(((char *)&C2_W_065DC) + C2_W_SAMPLE_DUMP_CURSOR * 42) | *(int *)(((char *)&C2_TBL_SDUMP_FIELD_ENTER) + C2_W_SAMPLE_DUMP_CURSOR * 42))) goto br_559E1;
	sample_dump_refresh();
	((int (__far *)(void))*(long *)(((char *)&C2_TBL_SDUMP_FIELD_ENTER) + C2_W_SAMPLE_DUMP_CURSOR * 42))();
br_559E1:
	;
}
