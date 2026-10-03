#include "mpc2k.h"

void __far __fastcall __loadds X_042E8(void)
{
	switch (G_UI_MODE) { case 3: case 6: goto X_04304; }
	G_UI_MODE++;
	fx_autopan_arm_field();
X_04304:
	;
}
