#include "mpc2k.h"

void __far __pascal seq_select_setup_2(long p0)
{
	ivt_set_vector(0x3d, p0);
}
