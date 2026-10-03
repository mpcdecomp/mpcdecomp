#include "mpc2k.h"

void __far __pascal timer_value_read_1(char __far *p, int a, int b, int n)
{
	status_read_6A_3((long)p, n ? 0x22 : 0x23, 0x62, 2, (char)a, (char)b, 0L, 0L);
	WIN_FIELD_BOX_W = 0x24;
	far_02DC8();
}
