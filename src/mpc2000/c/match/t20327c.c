#include "mpc2k.h"

void __far __pascal status_read_6A_2(long p9, int p8, int p7, char p6, char p5, char p4, long p2, long p0)
{
	field_register(p9, (long)p8, (long)p7, p6, p5, p4, p2, p0);
	WIN_FIELD_MODE = WF_S16;
}
