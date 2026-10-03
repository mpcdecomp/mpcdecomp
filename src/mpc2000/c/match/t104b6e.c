#include "mpc2k.h"

void __far __fastcall __loadds X_04AE8(void)
{
	switch (G_UI_SUBMODE) { case 0: goto X_04B0A; case 4: goto L_04B02; }
	G_UI_SUBMODE--;
	goto L_04B07;
L_04B02:
	G_UI_SUBMODE = 0;
L_04B07:
	fx_reverb_arm_field();
X_04B0A:
	;
}
