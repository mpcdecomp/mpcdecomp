#include "mpc2k.h"

void __far __fastcall __loadds X_085E6(void)
{
	voice_release_all();
	if (sample_ptr_helper((*(long *)&SND_CURRENT))) goto X_0860E;
	(*(long *)&SND_CURRENT) = far_078E4();
X_0860E:
	((void (__far __pascal *)(long))voice_buffer_init)((*(long *)&SND_CURRENT));
	((void (__far *)(void))zone_range_clamp)();
	X_07C12();
	int44_wrapper(0);
	trim_screen_enter();
}
