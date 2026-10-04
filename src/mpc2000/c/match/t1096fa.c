#include "mpc2k.h"

typedef char __far *FP;

int __far status_read_multi(char __far *name)
{
	char buf[18];
	int k;
	long t;
	struct SND __far *res;
	int err;

	res = 0;
	k = -1;
	if ((err = _setjmp(P_8F62)) == 0) {
		if (!sample_access_caller(name, 0)) _longjmp(P_8F62, G_ERRNO);
		((void (__near __pascal *)(FP))pad_velocity_handler)(buf);
		k = ((int (__near __pascal *)(FP, long))mode_handler)(buf, t = ((long (__near __pascal *)(long))status_poll_handler)(0x61746164L));
		res = ((struct SND __far *(__near __pascal *)(FP, FP, long))voice_play_request)(name, buf, t);
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
