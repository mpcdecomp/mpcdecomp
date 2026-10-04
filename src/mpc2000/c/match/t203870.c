#include "mpc2k.h"

void __far __pascal timer_value_read_2(char v, int x, int y)
{
	if ((unsigned)(v - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1) {
		draw_unsigned_value(x, y, (long)v, 2);
		return;
	}
	((void (__far __pascal *)())cmd_dispatch_1E)(x, y, STR_DOUBLE_DASH);
}
