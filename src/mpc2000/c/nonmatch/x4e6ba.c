#include "mpc2kxl.h"

struct g_C2_TBL_PARAMS_FIELD_THUNK {
    long f_0;
};

void __far __fastcall __loadds pgm_params_enter(void)
{
	int ax;
	int ax2;
	long t1;

	handler_set_install(MK_FP(SEG_DATA, 0x2e5e));
	C2_W_PARAM_HOOK_OFF = 0x88a;
	C2_W_PARAM_HOOK_SEG = 0x4e16 /* C2_SEG */;
	pad_route_mode_set(1);
	C2_B_PAD_VELOCITY = (char)127;
	if (C2_W_PARAMS_CURSOR < 0) {
		goto L1;
	}
	if ((unsigned int)C2_W_PARAMS_CURSOR < 9) {
		goto L2;
	}
L1:
	C2_W_PARAMS_CURSOR = 0;
L2:
	t1 = (*(long (far *)())*(long *)((char *)&(*(struct g_C2_TBL_PARAMS_FIELD_THUNK *)&C2_TBL_PARAMS_FIELD_THUNK) + 0 + C2_W_PARAMS_CURSOR * 42))();
	return;
}
