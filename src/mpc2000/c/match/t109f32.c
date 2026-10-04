#include "mpc2k.h"

int __far seq_event_handler(char __far *name, long len, long u, void __far *x)
{
	int k;
	struct SND __far *res;
	int err;

	res = 0;
	k = -1;
	if ((err = _setjmp(P_9D8E)) == 0) {
		if (!sample_access_caller(name, 0)) _longjmp(P_9D8E, G_ERRNO);
		k = track_event_handler(len);
		res = ((struct SND __far *(__near __pascal *)(char __far *, void __far *, long))lcd_clear_line)(name, x, len);
		res->pool_idx = k;
		int2F_dispatch_10();
		((void (__far __pascal *)(struct SND __far *))ui_enter_pad_assign)(res);
		return 1;
	}
	int2F_dispatch_10();
	G_ERRNO = err;
	err_msg_report();
	return 0;
}
