#include "mpc2kxl.h"

extern long C0_W_0D7C2;

void __far __fastcall __loadds load_sound_exists_replace(void)
{
	long l4;

	switch (((int (__far *)(char __far *, long))far_3FF18)(&l4, C0_W_0D7C2)) { case 0: goto br_46395; }
	((void (__far *)(long, long))pgm_replace_sound_ref)(l4, C0_W_0D7C2);
	((void (__far *)(long))sound_list_unlink)(l4);
br_46395:
	far_3E99C();
}
