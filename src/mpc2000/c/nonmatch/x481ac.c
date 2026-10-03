#include "mpc2kxl.h"

void __far __fastcall __loadds field_digit_cursor_dec(void)
{
	if (C2_B_08B2E == 0) {
		goto L1;
	}
	C2_B_08B2E = (char)(C2_B_08B2E - 1);
L1:
	return;
}
