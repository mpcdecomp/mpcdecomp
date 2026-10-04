#include "mpc2kxl.h"

extern char EP_FAR_483FC_OFF[1];
extern char EP_FAR_483FC_SEG[1];

void __far __fastcall __loadds L_47A80(void)
{
	((void (__far *)(long, char __near *, char __near *))far_3EE00)((*(long *)&FE_VALUE), EP_FAR_483FC_OFF, EP_FAR_483FC_SEG);
}
