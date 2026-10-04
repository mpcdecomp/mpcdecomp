#include "mpc2k.h"

void __far L_09900(void)
{
	voice_release_all_if((*(long *)&SND_CURRENT));
}
