#include "mpc2kxl.h"

extern char C0_B_098B8;
extern char C1_B_0D7DC;

void __far __fastcall __loadds zone_count_do_it(void)
{
	C1_B_0D7DC = C0_B_098B8;
	far_4D678();
	zone_count_close();
}
