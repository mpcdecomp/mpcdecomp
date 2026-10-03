#include "mpc2k.h"

int __far __pascal midi_realtime_continue(char __far *p)
{
	char __far *q;
	char flag;
	char ch;

	flag = !p[0x10];
	ch = p[0xe];
	q = (char __far *)(*(unsigned __far *)(p + 6) + ((long)*(int __far *)p << 16));
	G_ERRNO = 5;
	if (int2F_call_fn14(q) && smem_access_handler_3((long)q)) {
		if (flag) return event_handler(P_8D44, ch, 0);
	} else
		err_msg_report();
	return 0;
}
