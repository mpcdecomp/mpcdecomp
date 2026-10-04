#include "mpc2kxl.h"

void __far __fastcall __loadds assign_view_close(void)
{
	assign_view_refresh();
	pgm_assign_screen_draw();
}
