#include "mpc2kxl.h"

int __near fn_3D356(void)
{
	int bx;
	int bx2;
	unsigned int cx;
	unsigned int cx2;

	cx = 0x100;
	bx = 0;
L1:
	outpw(162, cx);
	outpw(160, bx);
	bx = bx + 0x3333;
	cx = cx + 1;
	if (cx < 0x120) {
		goto L1;
	}
	cx2 = 0x100;
	bx2 = 0;
L2:
	outpw(162, cx2);
	if (inpw(160) != bx2) {
		goto L3;
	}
	bx2 = bx2 + 0x3333;
	cx2 = cx2 + 1;
	if (cx2 < 0x120) {
		goto L2;
	}
	goto L4;
L3:
	return 0;
L4:
	return 1;
}
