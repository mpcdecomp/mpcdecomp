#include "mpc2kxl.h"

extern char C0_W_098C2[1];

void __far far_4582A(void)
{
	long l8;
	char far *v0;

	v0 = ((long (__far *)(char __far *, char __far *))fn_45864)(&l8, C0_W_098C2);
	if (!v0) {
		((void (__far *)(long))far_46126)(l8);
		return;
	}
	((void (__far *)(char __far *))disp_alert_wait_key)(v0);
}
