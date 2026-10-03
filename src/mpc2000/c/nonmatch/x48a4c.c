#include "mpc2kxl.h"

int __far __fastcall __loadds sample_record_reset_peak(void)
{
	C2_W_08B50 = -63;
	C2_W_08B4E = -63;
	C2_W_08B54 = -64;
	C2_W_08B52 = -64;
	return -64;
}
