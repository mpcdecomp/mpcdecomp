#include "mpc2k.h"

extern char DISPLAY_DRAW_PAIR[1];

void __far __fastcall __loadds L_09A72(void)
{
	install_handler(0x32, (void (far *)(void))display_draw_pair);
}
