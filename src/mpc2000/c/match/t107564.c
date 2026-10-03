#include "mpc2k.h"

void __far __fastcall __loadds lcd_port_handler(int k)
{
	if (P_9D40) {
		if (fn_067C2()) {
			rec_arm_field();
			return;
		}
	} else if (SAMPLE_INPUT && !L_00106())
		fn_06786();
	mpc_rate_caller();
	ctrl_port_18_write(k);
}
