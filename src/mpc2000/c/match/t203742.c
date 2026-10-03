#include "mpc2k.h"

void __far __pascal timer_dma_ch2(long p9, char p8, char p7, char p6, char p5, char p4, long p2, long p0)
{
	status_read_6A_3(p9, p8, p7, p6, p5, p4, p2, p0);
	install_handler(0x12, (void (far *)(void))T2_L_037AA);
}
