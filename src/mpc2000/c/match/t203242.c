#include "mpc2k.h"

void __far __pascal status_read_6A(long p9, int p8, int p7, char p6, char p5, char p4, long p2, long p0)
{
	((void (__far __pascal *)(long, int, int, int, int, char, char, char, long, long))field_register)(p9, 0, p8, 0, p7, p6, p5, p4, p2, p0);
	WIN_FIELD_MODE = 2;
}
