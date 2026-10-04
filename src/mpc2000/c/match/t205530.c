#include "mpc2k.h"

void __far __fastcall __loadds copy_fx_paint(void)
{
	disp_list_run(DL_COPY_FX_SETTINGS);
	sequence_get_info(G_COPY_SRC_PGM, 0x55, 0xb);
	((void (__far __pascal *)(int, int, int, int))cmd_dispatch_1E)(0x55, 0x14, *(int *)(FX_TYPE_LABELS + (*(unsigned char *)G_COPY_SRC_NOTE) * 4 + 2), *(int *)(FX_TYPE_LABELS + (*(unsigned char *)G_COPY_SRC_NOTE) * 4));
	sequence_get_info(G_COPY_DST_PGM, 0x55, 0x20);
	((void (__far __pascal *)(int, int, int, int))cmd_dispatch_1E)(0x55, 0x29, *(int *)(FX_TYPE_LABELS + (*(unsigned char *)G_COPY_DST_NOTE) * 4 + 2), *(int *)(FX_TYPE_LABELS + (*(unsigned char *)G_COPY_DST_NOTE) * 4));
	field_redraw();
}
