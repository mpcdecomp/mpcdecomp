#include "mpc2kxl.h"

extern char C0_B_09604[1];
extern char EP_L_3D1F0_OFF[1];
extern char EP_L_3D1F0_SEG[1];

void __far __fastcall __loadds fx_delay_f5(void)
{
	fx_edit_refresh();
	((void (__far *)(char __near *, char __near *, char __far *))far_54566)(EP_L_3D1F0_OFF, EP_L_3D1F0_SEG, C0_B_09604);
}
