#include "mpc2k.h"

void __far __fastcall __loadds X_0A02A(void)
{
	if (!int2F_dispatch_17()) {
		string_fill_stosb(STR_CHANGE_DISK_2);
		return;
	}
	disp_list_run(DL_SAVING);
	int2F_call_fn4(P_417E);
	if (event_handler(P_8D44, W_5BB0 << 0xf >> 0xf, W_5BAE)) goto br_0A079;
	int43_wrapper(5);
br_0A079:
	;
}
