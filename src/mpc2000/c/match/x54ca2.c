#include "mpc2kxl.h"

extern char C2_W_05962[1];

void __far __fastcall __loadds build_info_f6(void)
{
	handler_set_install(C2_W_05962);
	disp_clear_all();
	far_54CD4();
}
