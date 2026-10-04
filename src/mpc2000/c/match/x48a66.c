#include "mpc2kxl.h"

extern int C1_W_0D7D2;
extern char C2_B_098BC;
extern char EP_MSG_SOUND_DIR_FULL_OFF[1];
extern char EP_MSG_SOUND_DIR_FULL_SEG[1];

void __far __fastcall __loadds sample_record_record(void)
{
	if (((int (__far *)(void))far_3FE60)() >= 0x100) {
		((void (__far *)(char __near *, char __near *))disp_alert_wait_key)(EP_MSG_SOUND_DIR_FULL_OFF, EP_MSG_SOUND_DIR_FULL_SEG);
		return;
	}
	if (!C1_W_0D7D2) goto br_48A92;
	C2_B_098BC = 1;
br_48A92:
	;
}
