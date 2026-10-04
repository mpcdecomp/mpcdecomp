#include "mpc2kxl.h"

extern char C2_B_08FCA;

void __far __fastcall __loadds sample_record_stop(void)
{
	C2_B_08FCA = 1;
}
