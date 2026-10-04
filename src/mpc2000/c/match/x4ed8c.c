#include "mpc2kxl.h"

void __far __fastcall __loadds pgm_midi_f1(void)
{
	pgm_midi_refresh();
	pgm_assign_screen_draw();
}
