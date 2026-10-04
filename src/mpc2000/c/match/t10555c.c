#include "mpc2k.h"

void __near L_054DC(void)
{
	int col;
	int row;
	int v;

	v = G_PAD_INDEX & 0xf;
	col = v % 4;
	row = v / 4;
	timer_value_read_1(PTR_TRACK_DATA + (unsigned char)G_PAD_INDEX, 0x5b, 10, 1);
	EDIT_CURSOR_X = col * 0x36 + 0x13;
	EDIT_CURSOR_Y = 0x2b - (row << 3);
	WIN_FIELD_BOX_W = 0x30;
}
