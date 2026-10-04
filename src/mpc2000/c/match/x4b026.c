#include "mpc2kxl.h"

void __far __fastcall __loadds start_fine_open(void)
{
	voice_release_all();
	trim_screen_draw();
}
