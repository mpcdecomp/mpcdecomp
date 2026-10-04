#include "mpc2k.h"

void __far __fastcall __loadds X_08736(void)
{
	disp_list_run(DL_SOUND_INFO);
	cmd_dispatch_1E(0x67, 0xd, ((char __far *)SND_CURRENT));
	cmd_dispatch_1E(0x43, 0x27, ((char __far *)SND_CURRENT)[19] * 7 + TBL_MONO_STEREO_LABELS);
	draw_unsigned_value(0xaf, 0x1e, (unsigned long)(unsigned)*(int far *)(((char __far *)SND_CURRENT) + 38), 5);
	sample_calc_length(0xa9, 0x27, ((char __far *)SND_CURRENT));
	switch (sample_check_active(((char __far *)SND_CURRENT))) { case 0: goto L_087C0; }
	cmd_dispatch_1E(0x25, 0xd, STR_EDIT_COPY_TO_RAM);
	return;
L_087C0:
	cmd_dispatch_1E(0x25, 0xd, STR_SOUND_NAME_LBL);
	field_redraw();
}
