#include "mpc2kxl.h"

extern char C2_W_02600[1];
extern char C2_W_02788[1];

void __far L_4D1EC(void)
{
	C2_W_TS_CURSOR = 6;
	ui_field_engine(C2_W_02788, C2_W_02600);
}
