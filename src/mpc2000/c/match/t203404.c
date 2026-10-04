#include "mpc2k.h"

void __far __fastcall __loadds voice_port_read(void)
{
	char l1;

	G_FLAG_8CA8 = 1;
	l1 = ((char __near *)(G_SEQ_MODE + BUF_NAME_EDIT))[0];
loop_034AB:
	l1++;
	if (l1 >= 0x20) goto br_034B8;
	l1 = 0x20;
br_034B8:
	if (TBL_NAME_CHARSET[l1] == 0x2a) goto loop_034AB;
	((char __near *)(G_SEQ_MODE + BUF_NAME_EDIT))[0] = TBL_NAME_CHARSET[l1];
	((int (__far *)(void))((char __far *)NAME_EDIT_CHANGE_FN))();
}
