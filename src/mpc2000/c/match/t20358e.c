#include "mpc2k.h"

void __far __fastcall __loadds L_03614(void)
{
	NAME_EDIT_CASE = (char)(NAME_EDIT_CASE ? 0 : 1);
	((int (__far *)(void))((char __far *)NAME_EDIT_CHANGE_FN))();
}
