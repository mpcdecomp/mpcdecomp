#include "mpc2k.h"

void __far __pascal ctrl_port_48_read2(char __far *p)
{
	char __far *q;
	char __far *r;
	char c;
#if FW_VERSION == 172
	unsigned char c2;
#endif

	G_ERRNO = ERR_UNKNOWN;
	q = (char __far *)(*(unsigned __far *)(p + 6) + ((long)*(int __far *)p << 16));
	c = p[0x13];
#if FW_VERSION == 172
	c2 = p[0xc];
#endif
	r = ((char __far *(__far *)(void))far_0CDBA)();
	if (r) {
#if FW_VERSION == 172
		switch (c2) {
		default:
#endif
		if (c) ((void (__far __pascal *)(char __far *, char __far *))ctrl_io_setup)(r, q);
		else ((void (__far __pascal *)(char __far *, char __far *))far_memop_handler_2)(r, q);
#if FW_VERSION == 172
		break;
		case 1:
			((void (__far __pascal *)(char __far *, char __far *))int2F_fn14_caller)(r, q);
		}
#endif
	} else
		G_ERRNO = ERR_INTERNAL;
	if (G_ERRNO) err_msg_report();
}
