#include "mpc2k.h"

void __far __pascal field_register_s8(long p9, char p8, char p7, char p6, char p5, char p4, long p2, long p0)
{
	field_register(p9, (long)p8, (long)p7, p6, p5, p4, p2, p0);
	WIN_FIELD_MODE = 1;
}
