#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_0148C[1];

void __far sample_record_focus_field2(void)
{
	C2_W_SAMPLE_REC_CURSOR = 2;
	C0_B_098B8[0] = C2_B_0D7CE;
	ui_field_engine(C2_W_0148C, C0_B_098B8);
}
