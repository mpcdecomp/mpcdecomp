#include "mpc2kxl.h"

void __far __fastcall __loadds fx_edit_refresh(void)
{
	if (C2_B_09604 & 1) goto br_52BC0;
	if (!(C2_B_09604 & 2)) goto br_52BCC;
br_52BC0:
	far_556E0(C0_B_0D7C7);
br_52BCC:
	(*(long *)&C2_W_PARAM_HOOK_OFF) = 0L;
	return 0;
}
