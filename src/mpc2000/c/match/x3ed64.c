#include "mpc2kxl.h"

void __far smem_proc_wrapper(long p0)
{
	((void (__far *)(int, int, int, int, long))draw_frame_window)(0xc, 2, 0xe0, 0x3a, p0);
}
