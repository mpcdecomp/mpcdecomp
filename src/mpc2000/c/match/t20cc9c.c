#include "mpc2k.h"

#define S(x) ((char __far *)(x))

void __far __fastcall __loadds data_far_write(void)
{
	char b[3];

	disp_list_run(P_4280);
	cmd_build_dispatch(0, 0, 0x7b, 0x31);
	cmd_build_dispatch(0x7d, 0, 0x7a, 0x31);
	cmd_dispatch_1E(3, 0xf, S(STR_RECEIVE_READY));
	cmd_dispatch_1E(3, 0x18, S(STR_THIS_PAGE_OPEN));
	cmd_dispatch_1E(3, 0x25, S(STR_REQUEST_NO));
	cmd_dispatch_1E(0x80, 0xe, S(STR_SND_5));
	cmd_dispatch_1E(0x80, 0x25, S(STR_EXCLUSIVE_CH));
	draw_unsigned_value(0x69, 2, (long)((char)SDS_RX_PORT[0] + 1), 1);
	draw_unsigned_value(0x4b, 0x25, (long)(unsigned char)SDS_REQUEST_NUM, 3);
	cmd_ratio_setup(0xe6, 2, SDS_TX_PORT[0] + 'A');
	if (*(long *)PTR_LCD_STATE) {
		cmd_dispatch_1E(0x80, 0x17, *(char __far **)PTR_LCD_STATE);
		if ((*(char __far **)PTR_LCD_STATE)[0x13]) {
			b[0] = ':';
			b[1] = 'L';
			b[2] = 0;
			if (SDS_STEREO_SIDE) b[1] = 'R';
			cmd_dispatch_1E(0xe0, 0x17, S(b));
		}
	} else
		cmd_dispatch_1E(0x80, 0x17, S(STR_NO_SOUND));
	draw_unsigned_value(0xce, 0x25, (long)SDS_EXCL_CH, 3);
	field_redraw();
	if (!(SDS_STATE & 3)) {
		if (SDS_STATE & 4) {
			cmd_dispatch_1E(1, 0x34, S(STR_RECEIVING));
			disp_list_run(P_42E6);
		} else
			disp_list_run(DL_SOFTKEYS_MIDI_DUMP);
	} else {
		cmd_dispatch_1E(1, 0x34, S(STR_SENDING));
		disp_list_run(P_42E6);
	}
}
