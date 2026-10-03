#include "mpc2kxl.h"

void __far __fastcall __loadds pgm_midi_f1(void)
{
	int t1;
	int t2;

	pgm_midi_refresh();
	pgm_assign_screen_draw();
	return;
}
