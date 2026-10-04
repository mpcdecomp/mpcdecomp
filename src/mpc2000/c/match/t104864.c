#include "mpc2k.h"

void __far __fastcall __loadds X_047DE(void)
{
	switch (G_UI_FLAG) { case 0: goto X_04800; case 4: goto L_047F8; }
	G_UI_FLAG--;
	goto L_047FD;
L_047F8:
	G_UI_FLAG = 0;
L_047FD:
	fx_echo_st_arm_field();
X_04800:
	;
}
