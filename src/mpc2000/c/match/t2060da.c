#include "mpc2k.h"

void __far __fastcall __loadds t2_copy_pgm_cancel(void)
{
	program_close();
	int43_wrapper(0x15);
}
