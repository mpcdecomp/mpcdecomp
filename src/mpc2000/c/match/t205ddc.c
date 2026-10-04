#include "mpc2k.h"

void __far __fastcall __loadds pgm_midi_paint(void)
{
	disp_list_run(P_2534);
	cmd_dispatch_1E(0x62, 0xf, MIDI_VOLUME_RX * 8 + TBL_IGNORE_RECEIVE_LABELS);
	cmd_dispatch_1E(0x62, 0x19, PGM_CHANGE_RX * 8 + TBL_IGNORE_RECEIVE_LABELS);
	cmd_dispatch_1E(0x62, 0x23, MIDI_LOCAL_MODE * 4 + TBL_OFF_ON_LABELS);
	draw_unsigned_value(0xe0, 0xf, (long)MIDI_VOLUME_VAL, 3);
	field_redraw();
}
