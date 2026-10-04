#include "mpc2k.h"

void __far __fastcall __loadds purge_do_it(void)
{
	disp_list_run((*(long *)&PTR_DL_PROCESSING));
	sample_gc();
	delay_ticks(0x64);
	disp_list_run(P_2606);
}
