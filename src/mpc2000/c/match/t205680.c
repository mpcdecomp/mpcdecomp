#include "mpc2k.h"

void __far __pascal cmd_dispatch_handler_3(int x, int y)
{
	if ((char)P_9D89[0] + 0xd <= 0) ((void (__far __pascal *)(int, int, char __far *))cmd_caller_setup)(x, y + 1, P_4CF9);
	else draw_signed_value(x, y, (long)((char)P_9D89[0] * 6), 2);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(x + 0x12, y, STR_DB_2);
}
