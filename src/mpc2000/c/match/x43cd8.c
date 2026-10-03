#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C1_W_0098A[1];

void __far far_43CD8(void)
{
	*(int *)C0_B_098B8 = C1_W_08B04;
	ui_field_engine(C1_W_0098A, C0_B_098B8);
}
