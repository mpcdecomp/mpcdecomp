#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_01438[1];

void __far sample_record_focus_field0(void)
{
	C2_W_SAMPLE_REC_CURSOR = 0;
	C0_B_098B8[0] = C2_B_0D7CC;
	ui_field_engine(C2_W_01438, C0_B_098B8);
}
