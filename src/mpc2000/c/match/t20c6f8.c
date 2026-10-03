#include "mpc2k.h"

int __far __pascal ctrl_port_48_read(long p1, int p0)
{
	switch (bcd_display_calc(&p0, 2)) { case 0: goto br_0CB5C; }
	switch (bcd_display_calc(p1, p0)) { case 0: goto br_0CB5C; }
	return 1;
br_0CB5C:
	return 0;
}
