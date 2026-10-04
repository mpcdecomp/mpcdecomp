#include "mpc2k.h"

void __far far_08010(void)
{
	disp_list_run(P_30CC);
	ui_row_request(0x18);
}
