#include "mpc2kxl.h"

extern char C0_W_098C2[1];

void __far L_3AF9E(long p0)
{
	long l8;
	char far *v0;

	v0 = ((long (__near *)(char __far *, char __far *, long))lcd_clear_line)(&l8, C0_W_098C2, p0);
	if (!v0) {
		((void (__far *)(long))far_46126)(l8);
		return;
	}
	((void (__far *)(char __far *))disp_alert_wait_key)(v0);
}
