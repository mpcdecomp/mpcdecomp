#include "mpc2k.h"

void __far __fastcall __loadds L_0B0BE(void)
{
	if (!int2F_dispatch_17()) {
		string_fill_stosb(((char *)STR_CHANGE_DISK));
		return;
	}
	disp_list_run(DL_LOADING);
	if (((int (__far *)(void))((char __far *)W_8F48))()) goto br_0B0F9;
	disp_list_run(((char *)P_3C0A));
	int43_wrapper(3);
br_0B0F9:
	;
}
