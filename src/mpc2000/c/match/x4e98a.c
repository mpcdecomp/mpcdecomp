#include "mpc2kxl.h"

extern char EP_PGM_PARAMS_ENTER_OFF[1];
extern char EP_PGM_PARAMS_ENTER_SEG[1];

void __far __fastcall __loadds tgt_4E98A(void)
{
	audition_stop();
	((void (__far *)(char __near *, char __near *))far_50972)(EP_PGM_PARAMS_ENTER_OFF, EP_PGM_PARAMS_ENTER_SEG);
}
