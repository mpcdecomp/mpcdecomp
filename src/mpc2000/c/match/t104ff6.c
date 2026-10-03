#include "mpc2k.h"

void __near X_04F76(void)
{
	((void (__far __pascal *)(void (__far *)(void)))install_handler_15)(((void (__far *)(void))X_05776));
	((void (__far __pascal *)(char __far *, int, int, int, int, void (__far *)(void)))voice_trigger_full)(((char *)&G_PAD_INDEX), 0x3f, 0x20, 0xc, 4, loop_seq_handler);
}
