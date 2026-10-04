#include "mpc2kxl.h"

extern char EP_MSG_CHANGE_DISK_OFF[1];
extern char EP_MSG_CHANGE_DISK_SEG[1];

void __far __fastcall __loadds X_449E2(void)
{
	if (!((int (__far *)(void))disk_media_ready_check)()) {
		((void (__far *)(char __near *, char __near *))disp_alert_wait_key)(EP_MSG_CHANGE_DISK_OFF, EP_MSG_CHANGE_DISK_SEG);
		return;
	}
	far_42AFE();
	((void (__far *)(long))far_444F6)((*(long *)&C1_W_08B0E));
}
