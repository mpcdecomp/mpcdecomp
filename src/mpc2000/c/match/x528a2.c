#include "mpc2kxl.h"

extern char C0_B_09604[1];
extern char EP_FAR_5277C_OFF[1];
extern char EP_FAR_5277C_SEG[1];

void __far __fastcall __loadds fx_dist_ringmod_f5(void)
{
	fx_edit_refresh();
	((void (__far *)(char __near *, char __near *, char __far *))far_54566)(EP_FAR_5277C_OFF, EP_FAR_5277C_SEG, C0_B_09604);
}
