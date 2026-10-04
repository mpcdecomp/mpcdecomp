#include "mpc2kxl.h"

extern char C0_B_0D7F8;
extern char C0_W_0D7E8[1];
extern char EP_L_3A7C4_OFF[1];
extern char EP_L_3A7C4_SEG[1];

void __far __fastcall __loadds file_exists_f5(void)
{
	C0_B_0D7F8 = 0;
	((void (__far *)(int, char __near *, char __near *))handler_install_one)(0x32, EP_L_3A7C4_OFF, EP_L_3A7C4_SEG);
	((void (__far *)(char __far *, int, int))far_3EE00)(C0_W_0D7E8, 0, 0);
}
