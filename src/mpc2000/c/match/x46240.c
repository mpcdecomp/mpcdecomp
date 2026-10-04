#include "mpc2kxl.h"

extern long C0_W_0D7C2;

void __far __fastcall __loadds load_sound_refresh(void)
{
	far_46178();
	((void (__far *)(long))sound_list_unlink)(C0_W_0D7C2);
}
