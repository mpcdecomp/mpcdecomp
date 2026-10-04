#include "mpc2kxl.h"

extern char EP_LOOP_SCREEN_DRAW_OFF[1];
extern char EP_LOOP_SCREEN_DRAW_SEG[1];

void __far __fastcall __loadds far_4BAA8(void)
{
	loop_screen_refresh();
	((void (__far *)(char __near *, char __near *))far_55112)(EP_LOOP_SCREEN_DRAW_OFF, EP_LOOP_SCREEN_DRAW_SEG);
}
