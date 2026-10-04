#include "mpc2kxl.h"

extern char C0_B_0D7DD[1];
extern char C1_B_0D7DC;
extern char C2_W_02920[1];
extern long C2_W_0292A;

void __far L_4D654(void)
{
	C2_W_ZONE_CURSOR = 4;
	C2_W_0292A = (long)C1_B_0D7DC;
	ui_field_engine(C2_W_02920, C0_B_0D7DD);
}
