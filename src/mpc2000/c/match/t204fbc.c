#include "mpc2k.h"

void __far __fastcall __loadds status_read_6A_4(void)
{
	char far *v0;

	((void (__far __pascal *)(char __far *))ctrl_change_table_dispatch)(P_1930);
	v0 = channel_validate(G_STATE_9D8B);
	lcd_init_display(0x91, 0x15, *(int far *)(v0 + 38));
	lcd_init_display(0xbb, 0x15, *(int far *)(v0 + 40));
	if (G_FX_EFFECT_SEL != 6) goto br_051D0;
	cmd_dispatch_1E(0x6d, 0x1f, STR_FX_DELAY_MS);
	cmd_dispatch_1E(0x5b, 0x29, STR_FX_FEEDBACK);
	draw_unsigned_value(0x97, 0x1f, (unsigned long)(unsigned)*(int far *)(v0 + 42), 3);
	draw_unsigned_value(0xc1, 0x1f, (unsigned long)(unsigned)*(int far *)(v0 + 44), 3);
	draw_unsigned_value(0x9d, 0x29, (unsigned long)(unsigned char)v0[46], 2);
	draw_unsigned_value(0xc7, 0x29, (unsigned long)(unsigned char)v0[47], 2);
br_051D0:
	field_redraw();
}
