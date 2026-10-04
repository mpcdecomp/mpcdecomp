#include "mpc2kxl.h"

extern char EP_FAR_50EE2_OFF[1];
extern char EP_FAR_50EE2_SEG[1];

void __far __fastcall __loadds L_50FBA(void)
{
	far_51016();
	((void (__far *)(char __near *, char __near *))far_4DBAA)(EP_FAR_50EE2_OFF, EP_FAR_50EE2_SEG);
}
