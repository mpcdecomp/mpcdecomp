#include "mpc2k.h"

void __far __pascal voice_trigger_caller(char p3, char p2, char far *p0)
{
	if (!p0) goto br_07F6B;
	((void (__far __pascal *)(char __far *))install_handler_15)(p0);
br_07F6B:
	((void (__far __pascal *)(char __far *, int, char, char, int, long))voice_trigger_full)(((char *)&PLAY_X_MODE), 5, p3, p2, 9, 0L);
}
