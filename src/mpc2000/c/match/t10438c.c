#include "mpc2k.h"

void __far __fastcall __loadds X_04306(void)
{
	switch (G_UI_MODE) {
	case 4: case 5: case 6:
		G_UI_MODE -= 3;
		fx_autopan_arm_field();
	}
}
