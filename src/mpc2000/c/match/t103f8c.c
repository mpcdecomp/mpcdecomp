#include "mpc2k.h"

void __far __pascal ctrl_change_table_dispatch(long p0)
{
	disp_list_run((char __far *)DL_FX_MODULATION);
	fn_03902();
	disp_list_run((char __far *)p0);
	((void (__far __pascal *)(int, int, int, int))cmd_dispatch_1E)(0x31, 0xb, *(int *)(FX_MOD_TYPE_LABELS + G_FX_EFFECT_SEL * 4 + 2), *(int *)(FX_MOD_TYPE_LABELS + G_FX_EFFECT_SEL * 4));
}
