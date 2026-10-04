#include "mpc2kxl.h"

extern long C0_W_0D7C2;

void __far __fastcall __loadds sample_dump_send(void)
{
	switch (((int (__far *)(long))sound_list_contains)(C0_W_0D7C2)) { case 0: goto br_55A34; }
	C2_W_08DC4 = 1;
br_55A34:
	;
}
