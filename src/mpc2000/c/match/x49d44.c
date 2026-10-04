#include "mpc2kxl.h"

extern long C0_W_0D7C2;

void __far __fastcall __loadds keep_or_retry_refresh(void)
{
	((void (__far *)(long))sound_list_unlink)(C0_W_0D7C2);
}
