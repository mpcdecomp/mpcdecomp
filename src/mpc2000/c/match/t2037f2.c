#include "mpc2k.h"

void __far __pascal voice_trigger_full(long p6, char p5, char p4, char p3, char p2, long p0)
{
	status_read_6A_3(p6, 0, p5, 1, p4, p3, 0L, p0);
	(*(unsigned char *)&WIN_FIELD_BOX_W) = p2 * 6 - 6;
	win_keys_merge_disable();
}
