#include "mpc2k.h"

void __near lcd_update_handler_70E2(void)
{
	disp_list_run((*(long *)&PTR_DL_PROCESSING));
	lcd_update_handler();
	lcd_compute_coords();
	disp_list_run(P_2E33);
}
