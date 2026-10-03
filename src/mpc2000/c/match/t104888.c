#include "mpc2k.h"

void __far __fastcall __loadds X_04802(void)
{
	switch (G_UI_FLAG) { case 3: case 6: goto X_0481E; }
	G_UI_FLAG++;
	fx_echo_st_arm_field();
X_0481E:
	;
}
