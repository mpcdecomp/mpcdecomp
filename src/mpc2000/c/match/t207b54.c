#include "mpc2k.h"

void __far __pascal mode_dispatch_index(int p1, int p0)
{
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(p1, p0, PLAY_X_MODE * 9 + TBL_EDIT_RANGE_LABELS);
}
