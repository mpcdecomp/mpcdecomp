#include "mpc2k.h"

int __far __pascal midi_realtime_start(char __far *p)
{
	char a, f, ch;
	char __far *q;
	char __far *pg;

	a = p[0xc];
	f = !p[0x10];
	ch = p[0xe];
	q = (char __far *)(*(unsigned __far *)(p + 6) + ((long)*(int __far *)p << 16));
	G_ERRNO = ERR_INTERNAL;
	pg = ((char __far * __near *)PGM_TABLE)[a];
	if (*(unsigned __far *)pg > 2 && int2F_call_fn14(q) && ((int (__far __pascal *)(char __far *, char __far *))ctrl_port_caller)(pg, q)) {
		if (f) return event_handler(P_8D44, ch, 0);
	} else
		err_msg_report();
	return 0;
}
