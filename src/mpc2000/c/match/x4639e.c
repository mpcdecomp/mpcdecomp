#include "mpc2kxl.h"

extern long C0_W_0D7C2;

void __far __fastcall __loadds load_sound_exists_cancel(void)
{
	((void (__far *)(long))sound_list_unlink)(C0_W_0D7C2);
	far_3E99C();
}
