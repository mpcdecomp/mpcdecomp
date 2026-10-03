#include "mpc2k.h"

#if FW_VERSION != 150
extern char FX_OUT_PAIR_LABELS[20];
#endif

void __far __fastcall __loadds cmd_exec_7(void)
{
	char __far *p;

	p = (char __far *)channel_validate(G_STATE_9D8B);
	disp_list_run(P_1C36);
#if FW_VERSION == 150
	cmd_dispatch_1E(0x55, 0xe, (long)(char __far *)(TBL_OFF_ON_LABELS + p[5] * 4));
	cmd_dispatch_1E(0x19, 0x24, ((long *)FX_ROUTE_LABELS)[p[0x46]]);
#else
	cmd_dispatch_1E(0x55, 0xb, (long)(char __far *)(TBL_OFF_ON_LABELS + p[5] * 4));
	cmd_dispatch_1E(0x19, 0x1f, ((long *)FX_ROUTE_LABELS)[p[0x46]]);
	cmd_dispatch_1E(0x3d, 0x29, ((long *)FX_OUT_PAIR_LABELS)[B_9D8C]);
#endif
	draw_unsigned_value(0xa9, 0x15, (long)(unsigned char)p[0x14], 2);
	draw_unsigned_value(0xa9, 0x1f, (long)(unsigned char)p[0x40], 2);
	draw_unsigned_value(0xa9, 0x29, (long)(unsigned char)p[0x43], 2);
	cmd_exec_1E(0xbb, 0x15, p[0x15]);
	cmd_exec_1E(0xbb, 0x1f, p[0x41]);
	cmd_exec_1E(0xbb, 0x29, p[0x44]);
	draw_unsigned_value(0xd3, 0x1f, (long)(unsigned char)p[0x42], 2);
	field_redraw();
}
