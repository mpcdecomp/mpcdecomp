#include "mpc2k.h"

void __far __pascal voice_process_triple(int k)
{
	B_4FE2 &= ~2;
	B_4FE2 ^= 1;
	if (B_4FE2 & 1)
		B_4FE1 = ~(char)k & 0xfe;
	else if (G_STATE_9D8B < FX_MULTI_COUNT)
		B_4FE1 = channel_validate(G_STATE_9D8B)[0x45];
	else
		B_4FE1 = ((char __far *)channel_get_ptr(G_STATE_9D8B))[1];
	if (G_STATE_9D8B < FX_MULTI_COUNT) fx_redraw();
	else far_04B42();
}
