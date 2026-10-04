#include "mpc2kxl.h"

void __far __fastcall __loadds copy_pgm_refresh(void)
{
	fx_edit_refresh();
	mixer_setup_f6();
}
