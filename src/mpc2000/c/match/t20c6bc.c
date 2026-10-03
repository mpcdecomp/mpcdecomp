#include "mpc2k.h"

int __far __pascal smem_ctrl_setup_2(long p1, int p0)
{
	unsigned l2;

	l2 = 6;
	switch (((int (__far __pascal *)(long, unsigned))bcd_display_calc)(&l2, 2)) { case 0: goto br_0CB2A; }
	switch (((int (__far __pascal *)(long, unsigned))bcd_display_calc)(p1, (unsigned)((unsigned long)(unsigned)l2 * (unsigned)p0))) { case 0: goto br_0CB2A; }
	return 1;
br_0CB2A:
	return 0;
}
