#include "mpc2kxl.h"

extern char C0_B_0D7F9;
extern char C0_W_0D7E8[1];

void __far __fastcall __loadds file_exists_f3(void)
{
	char far *v0;

	if (((int (__far *)(void))far_37E82)() != 2) goto br_3A797;
	if (C0_B_0D7F9 != 0x53) goto br_3A797;
	if (((int (__far *)(char __far *))L_3E92C)(C0_W_0D7E8)) goto br_3A7C1;
br_3A797:
	v0 = ((long (__far *)(char __far *))far_42A32)(C0_W_0D7E8);
	if (!v0) {
		fn_3A7FA();
		return;
	}
	((void (__far *)(char __far *))disp_alert_wait_key)(v0);
	far_3E99C();
br_3A7C1:
	;
}
