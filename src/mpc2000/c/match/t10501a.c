#include "mpc2k.h"

void __near X_04F9A(void)
{
	install_handler_15((void (far *)(void))X_05776);
	status_read_6A_3(PTR_TRACK_DATA + (*(unsigned char *)&G_PAD_INDEX), 0x22, 0x62, 2, 0x56, 0xc, 0, 0, smem_loop_proc);
}
