#include "mpc2kxl.h"

long __far size_para_round_mul(long p0, int p2)
{
	return (p0 + 0xfL & 0xfffffff0L) * (long)p2;
}
