#include "mpc2k.h"

void __far __pascal read_io_chain(char arg_2, int arg_0)
{
	int ax;
	long t1;
	long t2;
	long t3;

#if FW_VERSION == 150
	t1 = ((long (__far __pascal *)(unsigned char __far *, int, int, int, char, char, int, int, void __far *))field_register_s8)((unsigned char far *)P_9D89, -13, 2, 2, arg_2, *(char *)((char *)&arg_0 + 0), 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, 0x3faa));
#else
	t1 = ((long (__far __pascal *)(unsigned char __far *, int, int, int, char, char, int, int, void __far *))field_register_s8)((unsigned char far *)P_9D89, -13, 2, 2, arg_2, *(char *)((char *)&arg_0 + 0), 0, 0, MK_FP(0x0b7c /* TEXT2_SEG */, 0x40f4));
#endif
	WIN_FIELD_BOX_W = (char)30;
	t2 = ((long (__far *)(void))win_keys_merge_disable)();
	t3 = ((long (__far *)(void))far_02DC8)();
	return;
}
