#include "mpc2k.h"

void __far L_09092(void)
{
	voice_release_all_if((*(long *)&SND_CURRENT));
	((void (__far *)(void))zone_range_clamp)();
	((void (__far __pascal *)(long))voice_buffer_init)((*(long *)&SND_CURRENT));
}
