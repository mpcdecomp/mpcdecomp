#include "mpc2kxl.h"

void __far __fastcall __loadds loop_fine_close(void)
{
	voice_release_all();
	loop_screen_draw();
}
