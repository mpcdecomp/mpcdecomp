#include "mpc2kxl.h"

extern char C0_B_09604[1];
extern char EP_FAR_53236_OFF[1];
extern char EP_FAR_53236_SEG[1];

void __far __fastcall __loadds fx_chorus_f5(void)
{
	fx_edit_refresh();
	((void (__far *)(char __near *, char __near *, char __far *))far_54566)(EP_FAR_53236_OFF, EP_FAR_53236_SEG, C0_B_09604);
}
