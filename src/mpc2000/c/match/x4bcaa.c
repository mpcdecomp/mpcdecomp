#include "mpc2kxl.h"

extern char EP_LOOP_SCREEN_DRAW_OFF[1];
extern char EP_LOOP_SCREEN_DRAW_SEG[1];

void __far far_4BCAA(void)
{
	((void (__far *)(char __near *, char __near *))far_4C0D8)(EP_LOOP_SCREEN_DRAW_OFF, EP_LOOP_SCREEN_DRAW_SEG);
}
