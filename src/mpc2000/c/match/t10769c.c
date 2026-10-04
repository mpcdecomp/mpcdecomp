#include "mpc2k.h"

void __near fn_0761C(void)
{
	int v0;

	disp_list_run(P_2E84);
	cmd_build_dispatch(0, 0x13, 0xf7, 0x1e);
	v0 = fn_0683A();
	if (SAMPLE_TIME <= (unsigned)v0) goto L_0763F;
	SAMPLE_TIME = v0;
L_0763F:
	callback_set_main(0, 0);
	win_keys_merge(TBL_WINKEYS_02E42);
	fn_0686A();
	rec_arm_field();
	fn_06786();
}
