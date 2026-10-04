#include "mpc2k.h"

void __far __pascal field_register(long p11, long p9, long p7, char p6, char p5, char p4, long p2, long p0)
{
	mpc_query_status(p5, p4, p6, p2, p0);
	NUM_ENTRY_VALUE = p9;
	NUM_ENTRY_MIN = p9;
	NUM_ENTRY_MAX = p7;
	WIN_FIELD_BOX_W = p6 * 6;
	WIN_FIELD_BOX_R = WIN_FIELD_BOX_W + p5 - 6;
	WIN_FIELD_BOX_B = p4 + 8;
	if (((int *)&NUM_ENTRY_MIN)[1] >= 0) goto X_0356A;
	WIN_FIELD_BOX_W += 6;
	WIN_FIELD_BOX_R += 6;
X_0356A:
	WIN_FIELD_MODE = WF_S32;
	(*(long *)&WIN_FIELD_VAR) = p11;
	win_keys_merge(TBL_WINKEYS_00CBA);
	if (p6 != 1) goto br_03590;
	far_02DC8();
br_03590:
	;
}
