#include "mpc2k.h"

void __far __fastcall __loadds fx_pitch_shift_right(void)
{
	switch (G_UI_MODE) { case 2: case 4: case 6: goto br_044F0; }
	G_UI_MODE++;
	fx_pitch_arm_field();
br_044F0:
	;
}
