#include "mpc2k.h"

int __cdecl abs(int);
#pragma intrinsic(abs)

void __far __pascal lcd_init_display(int x, int y, int v)
{
	cmd_ratio_setup(x, y, v < 0 ? '-' : ' ');
	cmd_exec_pair(x + 6, y, lcd_init_setup(abs(v)), 4);
}
