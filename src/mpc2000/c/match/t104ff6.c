#include "mpc2k.h"

void __near X_04F76(void)
{
	install_handler_15(((void (__far *)(void))X_05776));
	voice_trigger_full(((char *)&G_PAD_INDEX), 0x3f, 0x20, 0xc, 4, loop_seq_handler);
}
