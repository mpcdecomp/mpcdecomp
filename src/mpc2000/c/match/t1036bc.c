#include "mpc2k.h"

void __near mixer_arm_field(void)
{
	switch ((*(char *)&MIXSRC_CURSOR)) { case 0: goto br_03682; case 1: goto br_0364E; case 2: goto br_0365A; case 3: goto br_03672; }
	(*(char *)&MIXSRC_CURSOR) = 0;
	goto br_03682;
br_0364E:
	voice_trigger_full(MIX_INDIV_SOURCE, 1, 0x4b, 0x20, 8, 0, 0);
	return;
br_0365A:
	install_handler(WIN_K_OPEN, (void (far *)(void))L_03C56);
	((void (__far __pascal *)(int, int))read_io_chain)(0xb7, 0xe);
	return;
br_03672:
	voice_trigger_full(RECORD_MIX_CHANGES, 1, 0xb1, 0x27, 4, 0, 0);
	return;
br_03682:
	voice_trigger_full(MIX_STEREO_SOURCE, 1, 0x4b, 0x16, 8, 0, 0);
}
