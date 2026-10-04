#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C1_SEG[1];
extern char EP_LOAD_SOUND_EXISTS_REFRESH_OFF[1];
extern char EP_LOAD_SOUND_EXISTS_REFRESH_SEG[1];
extern char EP_L_46436_OFF[1];

void __far __fastcall __loadds load_sound_exists_rename(void)
{
	((void (__far *)(int, char __near *, char __near *))handler_install_one)(0x32, EP_L_46436_OFF, C1_SEG);
	((void (__far *)(char __far *, int, int))far_3EE00)(C0_W_0D7C2 + 0x12, 0, 0);
	((void (__far *)(int, char __near *, char __near *))handler_install_one)(0x34, EP_LOAD_SOUND_EXISTS_REFRESH_OFF, EP_LOAD_SOUND_EXISTS_REFRESH_SEG);
}
