#include "mpc2k.h"

void __far __pascal far_035F2(long p5, char p4, char p3, char p2, long p0)
{
	((void (__near __pascal *)(char, char, int, int, int, long))mpc_query_status)(p3, p2, 1, 0, 0, p0);
	*(long *)((char *)&WIN_FIELD_VAR) = p5;
	B_8CAB = p4;
	WIN_FIELD_BOX_W = 0x60;
	win_keys_merge_disable();
	win_keys_merge(TBL_WINKEYS_00D64);
}
