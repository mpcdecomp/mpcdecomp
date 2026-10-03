#include "mpc2k.h"

int __far __pascal ctrl_port_48_B8(int p0)
{
	switch (((int (__far __pascal *)(char __far *, int))bcd_display_calc)(&p0, 2)) { case 0: goto br_0C9F4; }
	switch (((int (__far __pascal *)(char __far *, int))bcd_display_calc)(TBL_SOUND_NAMES, p0 * 0x11)) { case 0: goto br_0C9F4; }
	return 1;
br_0C9F4:
	return 0;
}
