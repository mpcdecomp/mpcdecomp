#include "mpc2k.h"

void __far tgt_09C42(void)
{
	if (ZONE_LEN_FIX) {
		G_ZONE_END = G_ZONE_START + G_ZONE_LEN;
		return;
	}
	if (G_ZONE_END < G_ZONE_START) G_ZONE_END = G_ZONE_START;
	G_ZONE_LEN = G_ZONE_END - G_ZONE_START;
}
