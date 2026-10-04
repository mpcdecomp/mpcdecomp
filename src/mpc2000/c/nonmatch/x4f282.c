#include "mpc2kxl.h"

void __far __fastcall __loadds far_4F282(void)
{
	int ax;

	handler_set_install(MK_FP(SEG_DATA, 0x34d0));
	return;
}
