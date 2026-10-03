#include "mpc2k.h"

void __far __pascal cmd_dispatch_handler_2(int x, int y, char v)
{
	if (v > (char)0xdb) draw_signed_value(x, y, (long)v, 2);
	else ((void (__far __pascal *)(int, int, char __far *))cmd_caller_setup)(x, y + 1, P_4CF9);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(x + 0x12, y, STR_DB);
}
