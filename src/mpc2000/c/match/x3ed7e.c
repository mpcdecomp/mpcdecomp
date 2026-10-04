#include "mpc2kxl.h"

void __far draw_confirm_window(long p0)
{
	((void (__far *)(int, int, int, int, long))draw_frame_window)(0x30, 6, 0xc3, 0x36, p0);
}
