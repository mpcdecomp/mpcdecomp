#include "mpc2kxl.h"

void __far L_4E234(int p0)
{
	int dx_;

	if (p0 < 0x23) goto br_4E24A;
	if (p0 > 0x62) goto br_4E24A;
	dx_ = 1;
	goto br_4E24C;
br_4E24A:
	dx_ = 0;
br_4E24C:
	if (!dx_) goto br_4E254;
	C2_B_PAD_NOTE = (char)p0;
br_4E254:
	;
}
