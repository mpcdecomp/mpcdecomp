#include "mpc2k.h"

void __far __fstrncpy(char far *, long, int);

void __far __fastcall __loadds X_036C0(void)
{
	__fstrncpy(BUF_NAME_EDIT, (*(long *)&WIN_FIELD_VAR), 0x10);
	G_FLAG_8CA8 = 0;
	B_8CAB = 0;
	NAME_EDIT_LAST_PAD = 0xff;
	((int (__far *)(void))((char __far *)NAME_EDIT_CHANGE_FN))();
}
