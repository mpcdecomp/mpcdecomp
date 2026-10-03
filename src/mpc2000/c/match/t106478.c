#include "mpc2k.h"

void __near program_arm_field(void)
{
	switch (P_2522) { case 0: goto br_06448; case 1: goto br_06410; case 2: goto L_0641C; case 3: goto br_0642A; }
	P_2522 = 0;
	goto br_06448;
br_06410:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int))voice_trigger_full)(((char *)&PGM_CHANGE_RX), 1, 0x62, 0x19, 8, 0, 0);
	return;
L_0641C:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int))voice_trigger_full)(((char *)&MIDI_LOCAL_MODE), 1, 0x62, 0x23, 4, 0, 0);
	return;
br_0642A:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, int, int))status_read_6A_3)(((char *)&MIDI_VOLUME_VAL), 0, 0x7f, 3, 0xe0, 0xf, 0, 0, 0, 0);
	return;
br_06448:
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int))voice_trigger_full)(((char *)&MIDI_VOLUME_RX), 1, 0x62, 0xf, 8, 0, 0);
}
