#include "mpc2k.h"

void __near X_04FF2(void)
{
	((void (__far __pascal *)(void (__far *)(void)))install_handler_15)(((void (__far *)(void))L_05E34));
	timer_value_read_1(((char *)&G_PAD_NOTE_BASE), 0x26, 0x16, 0);
	WIN_FIELD_BOX_W = 0xc;
}
