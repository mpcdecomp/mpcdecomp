#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_f5(void)
{
	mixer_refresh();
	fx_not_installed_f5();
}
