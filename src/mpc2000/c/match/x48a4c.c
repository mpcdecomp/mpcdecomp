#include "mpc2kxl.h"

void __far __fastcall __loadds sample_record_reset_peak(void)
{
	C2_W_08B50 = -0x3f;
	C2_W_08B4E = -0x3f;
	C2_W_08B54 = -0x40;
	C2_W_08B52 = -0x40;
	return -0x40;
}
