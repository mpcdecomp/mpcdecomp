#include "mpc2kxl.h"

void __far __fastcall __loadds X_3A862(void)
{
	char far *v0;

	v0 = fs_close();
	if (!v0) {
		fn_3A892();
		return;
	}
	((void (__far *)(char __far *))disp_alert_wait_key)(v0);
	far_3E99C();
}
