#include "mpc2kxl.h"

extern char EP_FAR_4EF20_OFF[1];
extern char EP_FAR_4EF20_SEG[1];

void __far __fastcall __loadds purge_f4(void)
{
	((void (__far *)(char __near *, char __near *))far_4DBAA)(EP_FAR_4EF20_OFF, EP_FAR_4EF20_SEG);
}
