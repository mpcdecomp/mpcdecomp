#include "mpc2kxl.h"

extern char C2_B_08EBE;

void __far __fastcall __loadds sample_record_start(void)
{
	C2_B_08EBE = 1;
}
