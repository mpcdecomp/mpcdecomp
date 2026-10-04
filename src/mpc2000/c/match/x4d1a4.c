#include "mpc2kxl.h"

extern char C1_W_0D7DE[1];
extern char C2_W_0270A[1];

void __far far_4D1A4(void)
{
	C2_W_TS_CURSOR = 3;
	ui_field_engine(C2_W_0270A, C1_W_0D7DE);
}
