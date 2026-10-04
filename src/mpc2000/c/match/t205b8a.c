#include "mpc2k.h"

void __far __pascal seq_select_setup_1(long p0)
{
	ivt_set_vector(0x3c, p0);
}
