#include "mpc2k.h"

int __far __pascal bcd_display_calc(long p1, int p0)
{
	switch (int2F_call_fn9(p1, p0)) { case 0: goto br_0071C; case 1: goto br_00724; case 2: case 3: goto L_0072C; }
	G_ERRNO = ERR_INTERNAL;
	goto br_00732;
br_0071C:
	return 1;
br_00724:
	G_ERRNO = ERR_WRITE_PROTECTED;
	goto br_00732;
L_0072C:
	G_ERRNO = ERR_NO_DISK_SPACE;
br_00732:
	return 0;
}
