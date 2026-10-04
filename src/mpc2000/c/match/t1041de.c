#include "mpc2k.h"

void __far __fastcall __loadds fx_rotary_down(void)
{
	switch (G_UI_MODE) { case 2: case 5: goto L_04173; }
	G_UI_MODE++;
	fx_rotary_arm_field();
L_04173:
	;
}
