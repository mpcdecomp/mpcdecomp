#include "mpc2k.h"

void __far __pascal ui_field_edit(long p10, char p9, char p8, long p6, long p4, long p2, char far *p0)
{
	if (!p0) goto X_07F9F;
	((void (__far __pascal *)(char __far *))install_handler_15)(p0);
X_07F9F:
	((void (__far __pascal *)(long, long, long, int, char, char, long, long))field_register)(p10, p6, p4, 8, p9, p8, 0L, p2);
}
