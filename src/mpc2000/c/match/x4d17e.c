#include "mpc2kxl.h"

extern char C1_W_08FCB[1];
extern char C2_W_026E0[1];

void __far far_4D17E(void)
{
	C2_W_TS_CURSOR = 2;
	ui_field_engine(C2_W_026E0, C1_W_08FCB);
}
