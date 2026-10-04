#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_W_0211A[1];

void __far L_4B7CE(void)
{
	ui_field_engine(C2_W_0211A, C0_W_0D7C2 + 0x12);
}
