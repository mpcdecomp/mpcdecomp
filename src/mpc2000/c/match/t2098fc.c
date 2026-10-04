#include "mpc2k.h"

int __far L_09CE8(void)
{
	if (ZONE_LEN_FIX) {
		G_ZONE_START = G_ZONE_END - G_ZONE_LEN;
		return;
	}
	if (G_ZONE_END < G_ZONE_START) G_ZONE_START = G_ZONE_END;
	G_ZONE_LEN = G_ZONE_END - G_ZONE_START;
}
