#include "mpc2k.h"

void __far fx_type_load(void)
{
	B_4FE2 = 0;
	if (G_STATE_9D8B < FX_MULTI_COUNT) {
		B_4FE1 = channel_validate(G_STATE_9D8B)[69];
		return;
	}
	B_4FE1 = ((char __far * (__far *)(int))channel_get_ptr)(G_STATE_9D8B)[1];
}
