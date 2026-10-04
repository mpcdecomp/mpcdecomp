#include "mpc2kxl.h"

void __far __fastcall __loadds loop_end_fine_open(void)
{
	voice_release_all();
	loop_screen_draw();
}
