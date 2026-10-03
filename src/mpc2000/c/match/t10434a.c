#include "mpc2k.h"

void __far __fastcall __loadds X_042C4(void)
{
	switch (G_UI_MODE) { case 0: goto X_042E6; case 4: goto L_042DE; }
	G_UI_MODE--;
	goto L_042E3;
L_042DE:
	G_UI_MODE = 0;
L_042E3:
	fx_autopan_arm_field();
X_042E6:
	;
}
