#include "mpc2k.h"

char __far * __far __pascal note_range_clamp(int n)
{
	if (n < 0x23) n = 0x23;
	if (n > 0x62) n = 0x62;
	return (char __far *)&(MIX_INDIV_SOURCE[0] ? (struct PGM_MIX __far *)P_9DA0 : PGM_CURRENT->mix)[n - 0x23];
}
