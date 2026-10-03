#include "mpc2k.h"

void __far __fastcall __loadds zone_edit_up(void)
{
	G_PLAY_MODE = 0;
	field_edit_disable();
	switch (((int (__far __pascal *)(long))sample_check_active)((*(long *)&SND_CURRENT))) { case 0: goto br_0A05E; }
	((char *)&ZONE_EDIT_ACTION)[0] = 0;
	((char *)&G_EDIT_FIELD_VAL)[0] = 0;
	((void (__far __pascal *)(char __far *, char, char, char, char, long))voice_trigger_full)(((char *)&G_EDIT_FIELD_VAL), 0, 0x5b, 0x11, 0x19, 0L);
	X_02D4A();
	return;
br_0A05E:
	((void (__far __pascal *)(char __far *, char, char, char, char, long))voice_trigger_full)(((char *)&ZONE_EDIT_ACTION), 4, 0x5b, 0x11, 0x19, 0L);
	X_02D4A();
}
