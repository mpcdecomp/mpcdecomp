#include "mpc2kxl.h"

void __far __fastcall __loadds far_4E092(void)
{
	pgm_assign_refresh();
	((void (__far *)(void (__far *)(void)))far_4DBAA)((void (far *)(void))pgm_assign_screen_draw);
}
