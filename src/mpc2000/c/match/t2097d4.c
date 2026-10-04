#include "mpc2k.h"

int __far zone_range_clamp(void)
{
	if (!((char __far *)SND_CURRENT)) {
		G_ZONE_END = 0L;
		G_ZONE_START = 0L;
		G_ZONE_LEN = 0L;
		return 0;
	}
	if (*(long far *)(((char __far *)SND_CURRENT) + 28) >= G_ZONE_END) goto X_09C06;
	G_ZONE_END = *(long far *)(((char __far *)SND_CURRENT) + 28);
X_09C06:
	if (*(long far *)(((char __far *)SND_CURRENT) + 28) >= G_ZONE_START) goto L_09C2A;
	G_ZONE_START = *(long far *)(((char __far *)SND_CURRENT) + 28);
L_09C2A:
	G_ZONE_LEN = G_ZONE_END - G_ZONE_START;
	return (int)G_ZONE_LEN;
}
