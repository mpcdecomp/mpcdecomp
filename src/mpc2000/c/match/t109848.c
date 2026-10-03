#include "mpc2k.h"

void __near __pascal pad_velocity_handler(int arg_2, int arg_0)
{
	int loc_4;
	int loc_2;
	int p10;
	int p8;
	long t1;
	int t2;
	long t3;
	long t4;
	int t5;

	t1 = status_poll_handler(0x4646, 0x4952);
	((void (__near __pascal *)(int __far *, int))status_poll_delay)((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 4);
	if (loc_4 != 0x4157) {
		goto L1;
	}
	if (loc_2 == 0x4556) {
		goto L2;
	}
L1:
#if FW_VERSION == 150
	t3 = ((int (__far *)(void __far *, int))_longjmp)(MK_FP(SEG_DATA, -0x72de), 4);
#else
	t3 = ((int (__far *)(void __far *, int))_longjmp)(MK_FP(SEG_DATA, -0x709e), 4);
#endif
L2:
	p8 = arg_2;
	p10 = arg_0;
	t4 = status_poll_handler(0x2074, 0x6d66);
	envelope_process_1(p8, p10, t4);
	return;
}
