#include "mpc2kxl.h"

void __far __fastcall __loadds field_digit_entry_reset(void)
{
	C2_B_FE_FLAGS &= 0xfc;
}
